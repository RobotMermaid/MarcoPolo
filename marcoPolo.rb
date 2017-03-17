require 'capybara'
require 'capybara/poltergeist'
Capybara.default_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

browser = Capybara.current_session
browser.visit "http://10.0.0.1"
browser.fill_in('loginUsername', with: 'admin')
browser.fill_in('loginPassword', with: 'password')
browser.click_button('Log In')
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

File.rename('devicesNow.json', 'devicesMinsAgo.json')
File.open('devicesNow.json', 'w') { |file| file.write(deviceList.to_json) }
puts 'new file written'

file = File.read('devicesMinsAgo.json')
devices_old = JSON.parse(file)
difference = []
email_string = ""

# if deviceList.keys == devices_old.keys
#   puts "they match"
# elsif deviceList.size > devices_old.size
#   newDevice = deviceList.keys-devices_old.keys
#   difference << newDevice
#   puts newDevice
# else
#   puts  newDevice = devices_old.keys-deviceList.keys
#   difference << newDevice
#   puts newDevice
# end
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


# h.values_at("cow", "cat")  #=> ["bovine", "feline"]
