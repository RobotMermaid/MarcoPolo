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
  deviceList[key] = value == "On" ? 'here' :'gone'
end
# puts deviceList.to_json

# File.open('devices.json', 'w') { |file| file.write(deviceList.to_json) }
# puts 'new file written'


# File.open('devicesNow.json', 'w') { file.save devicesMinsAgo.json }

File.rename('devicesNow.json', 'devicesMinsAgo.json')

File.open('devicesNow.json', 'w') { |file| file.write(deviceList.to_json) }

puts 'new file written'
file = File.read('devicesMinsAgo.json')
devices_old = JSON.parse(file)
# puts deviceList.keys
# puts devices_old.keys
difference = []
diff = deviceList.size - devices_old.size
puts diff

if deviceList.keys == devices_old.keys
  puts "they match"
elsif deviceList.size > devices_old.size
  puts "they are not the same"
  puts  deviceList.keys-devices_old.keys
else
  puts  devices_old.keys-deviceList.keys

  # deviceList.each do |k, v|
  #   devices_old.each do |o, m|
  #     if k != o
  #           difference << [k, o]
  #     end
  #   end
  # end
  # puts difference
end


# end
# deviceList.each do |k, v|
#   devices_old.each do |e, a|
#     puts "#{k} #{v}"
#     puts "old#{e} #{a}"
#   #  puts i #shows both the key and the value
#   end
# end

email_string = ""
deviceList.each do |k, v|

    # puts "#{k} #{v}"
    # puts devices_old[k]
    if v != devices_old[k]
      email_string << " #{k}: #{v} was: #{devices_old[k]} - "
      difference << [k, v, devices_old[k]]
    end

end
puts "difference: #{difference}"
puts difference.size
if (difference.size > 0)
  `curl -X POST -H "Content-Type: application/json" -d \
  '{"value1":"#{email_string}"}' \
  https://maker.ifttt.com/trigger/network_change/with/key/pzoBEghOg1aYYaHGEWam9HfN6wjdk3u02qIRN2kVAVN`
end





# h.values_at("cow", "cat")  #=> ["bovine", "feline"]





# (deviceList.keys & devices_old.keys).each {|k| puts ( deviceList[k] == devices_old[k] ? deviceList[k] : k ) }
