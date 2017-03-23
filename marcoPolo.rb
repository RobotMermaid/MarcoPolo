require 'capybara'
require 'capybara/poltergeist'
require 'yaml'


config = YAML::load_file(File.join(__dir__, 'config.yaml'))
# config = YAML.load_file("/Users/Vesper/Documents/RobotMermaid/MarcoPolo/config.yaml")
@address = config["config"]["address"]
@login = config["config"]["login"]
@userNameField = config["config"]["userNameField"]
@userName = config["config"]["userName"]
@userPasswordField = config["config"]["userPasswordField"]
@userPassword = config["config"]["userPassword"]
@deviceFile = config["config"]["deviceFile"]
@eventName = config["config"]["eventName"]
@apiKey = config["config"]["apiKey"]


puts 'ohai'

Capybara.default_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

browser = Capybara.current_session
browser.visit 'http://10.0.0.1'
browser.fill_in(@userNameField, with: @userName)
# browser.fill_in('loginUsername', with: 'admin')
browser.fill_in(@userPasswordField, with: @userPassword)
browser.click_button(@login)
puts browser.current_url
# "http://10.0.0.1/at_a_glance.asp"
deviceTable = browser.find_by_id("internet-usage")
devicesAllDivs = browser.within(deviceTable) {browser.all 'div.form-row'}
deviceList = {}
devicesAllDivs.each do |div|
  key = div.find('span.readonlyLabel').text
  value  = div.find('span.on-off').text
  deviceList[key] = value == "On" ? 'here' : 'gone'
end

File.rename(@deviceFile, 'devicesMinsAgo.json')
File.open(@deviceFile, 'w') { |file| file.write(deviceList.to_json) }
puts 'i got this'

file = File.read('devicesMinsAgo.json')
devices_old = JSON.parse(file)
difference = []
email_string = ""

if deviceList.keys != devices_old.keys
  deviceList.size > devices_old.size ? newDevice = deviceList.keys-devices_old.keys : newDevice = devices_old.keys-deviceList.keys
  email_string << " #{newDevice} is new -"
  puts newDevice
end

deviceList.each do |k, v|
  if v != devices_old[k]
    email_string << " #{k} is now #{v} - "
  end
end


puts email_string
if (email_string.length > 0)
  `curl -X POST -H "Content-Type: application/json" -d \
  '{"value1":"#{email_string}"}' \
  https://maker.ifttt.com/trigger/network_change/with/key/pzoBEghOg1aYYaHGEWam9HfN6wjdk3u02qIRN2kVAVN`
end
