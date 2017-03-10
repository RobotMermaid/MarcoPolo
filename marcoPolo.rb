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
  deviceList[key] = value == "On" ? true : false
end
# puts deviceList.to_json

File.open('devices1.json', 'w') { |file| file.write(deviceList.to_json) }
# => ["On",
#  "WNR2000v4",
#  "Off",
#  "android-f91fefc76578edbd",
#  "On",
#  "lt-prangel-mac01",
#  "Off",
#  "Pauls-iPhone",
#  "Off",
#  "happy",
#  "On",
#  "themastrchez-PC",
#  "On",
#  "tw-mbp-paulrangel",
#  "On",
#  "Minutia",
#  "Off",
#  "morbius",
#  "Off",
#  "lt-prangel-mac01",
#  "Off",
#  "HouseOferssiPod",
#  "Off",
#  "ItsAllGreens-PC",
#  "Off",
#  "gort",
#  "Off",
#  "10.0.0.16",
#  "Off",
#  "raspberrypi",
#  "On",
#  "mbgua-laptop",
#  "On",
#  "Ondine",
#  "Off",
#  "raspberrypi",
#  "On",
#  "Shirka",
#  "Off",
