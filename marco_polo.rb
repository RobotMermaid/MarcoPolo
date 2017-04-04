require 'capybara'
require 'capybara/poltergeist'
require 'yaml'

CONFIG = YAML.load_file("./config.yaml") unless defined? CONFIG

class MarcoPolo
  attr_accessor :deviceList, :devices_old, :email_string
  def crawl_data
    Capybara.default_driver = :poltergeist
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, js_errors: false)
    end
    @browser = Capybara.current_session
    @browser.visit CONFIG['address']
    @browser.fill_in(CONFIG['userNameField'], with: CONFIG['userName'])
    @browser.fill_in(CONFIG['userPasswordField'], with: CONFIG['userPassword'])
    @browser.click_button(CONFIG['login'])
    puts @browser.current_url
  end

  def create_deviceList
    @deviceList = {}
    deviceTable = @browser.find_by_id("internet-usage")
    @devicesAllDivs = @browser.within(deviceTable) {@browser.all 'div.form-row'}
    all_devices
    # @devicesAllDivs.each do |div|
    #   key = div.find('span.readonlyLabel').text
    #   value  = div.find('span.on-off').text
    #   @deviceList[key] = value == "On" ? 'here' : 'gone'
    # end
  end

  def read_devices
    # save the device file from 5 minutes ago for comparison
    File.rename('devicesNow.json', 'devicesMinsAgo.json')
    # create the new device file
    File.open('devicesNow.json', 'w') { |file| file.write(@deviceList.to_json) }
    # bring in the json for both device files
    file = File.read('devicesMinsAgo.json')
    @devices_old = JSON.parse(file)
  end

  def compare_devices
    @email_string = ""
    if @deviceList.keys != @devices_old.keys
      @deviceList.size >@devices_old.size ? newDevice = @deviceList.keys-@devices_old.keys : newDevice = @devices_old.keys-@deviceList.keys
      @email_string << " #{newDevice.join(", ")} is new -"
      puts newDevice
    end
    @deviceList.each do |k, v|
      if v != @devices_old[k]
        email_string << " #{k} is now #{v} - "
      end
    end
  end

  def send_to_ifttt
    puts @email_string
    if (@email_string.length > 0)
      `curl -X POST -H "Content-Type: application/json" -d \
      '{"value1":"#{email_string}"}' \
      https://maker.ifttt.com/trigger/@eventName/with/key/@apiKey`
    end
  end

  private
  def all_devices
    @devicesAllDivs.each do |div|
      key = div.find('span.readonlyLabel').text
      value = div.find('span.on-off').text
      @deviceList[key] = value == "On" ? 'here' : 'gone'
    end
  end

end

puts 'ohai'
marco = MarcoPolo.new()
marco.crawl_data
marco.create_deviceList
marco.read_devices
marco.compare_devices
marco.send_to_ifttt
puts 'qapla'
