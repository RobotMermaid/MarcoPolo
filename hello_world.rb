IFTTT_CHANNEL_KEY = "REPLACE_ME"

require "bundler/inline"

gemfile do
 source "https://rubygems.org"
 gem "rails", "~> 5.0"
end

require "action_controller/railtie"
require "active_model/railtie"

class HelloWorld < Rails::Application
  routes.append do
    root to: "hello#world"

    get  "/ifttt/v1/status", to: "ifttt#status"
    post "/ifttt/v1/test/setup", to: "ifttt#setup"

    post "/ifttt/v1/triggers/new_thing_created", to: "ifttt#new_thing_created"
    post "/ifttt/v1/actions/create_new_thing", to: "ifttt#create_new_thing"
  end

  config.cache_store = :memory_store
  config.eager_load = false
  config.logger = Logger.new(STDOUT)
  config.secret_key_base = SecureRandom.hex(30)
end

class Thing
  include ActiveModel::Model
  attr_accessor :created_at

  def self.all
    Rails.cache.fetch("things") do
      [
        Thing.new(created_at: Time.parse("Jan 1")),
        Thing.new(created_at: Time.parse("Jan 2")),
        Thing.new(created_at: Time.parse("Jan 3")),
      ]
    end
  end

  def self.create
    Thing.new.tap do |new_thing|
      new_thing.created_at = all.last.created_at + 1.day
      Rails.cache.write("things", all.push(new_thing))
    end
  end

  def id
    created_at.to_i
  end

  def to_json
    {
      created_at: created_at.to_json,
      meta: { id: id, timestamp: created_at.to_i }
    }
  end

  def to_limited_json
    { id: id }
  end
end

class HelloController < ActionController::Base
  def world
    render plain: "Hello, Mermaid!" + "\n" + Thing.all.map(&:to_json).join("\n")
  end
end

class IftttController < ActionController::Base
  before_action :return_errors_unless_valid_channel_key
  before_action :return_errors_unless_valid_action_fields, only: :create_new_thing

  def status
    head :ok
  end

  def setup
    data = {
      samples: {
        actionRecordSkipping: {
          create_new_thing: { invalid: "true" }
        }
      }
    }

    render plain: { data: data }.to_json
  end

  def new_thing_created
    data = Thing.all.sort_by(&:created_at).reverse.map(&:to_json).first(params[:limit] || 50)
    render plain: { data: data }.to_json
  end

  def create_new_thing
    data = [ Thing.create.to_limited_json ]
    render plain: { data: data }.to_json
  end

  private
    def return_errors_unless_valid_channel_key
      unless request.headers["HTTP_IFTTT_CHANNEL_KEY"] == IFTTT_CHANNEL_KEY
        return render plain: { errors: [ { message: "401" } ] }.to_json, status: 401
      end
    end

    def return_errors_unless_valid_action_fields
      if params[:actionFields] && params[:actionFields][:invalid] == "true"
        return render plain: { errors: [ { status: "SKIP", message: "400" } ] }.to_json, status: 400
      end
    end
end

HelloWorld.initialize!
Rack::Server.start app: HelloWorld, Port: 3000
