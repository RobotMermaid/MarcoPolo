

puts "hey"
within_table('Employee') do
  fill_in 'Name', with: 'Jimmy'
end

# Capybara.register_driver :poltergeist do |app|
# Capybara::Poltergeist::Driver.new(app, js_errors: false)
# end
# Capybara.default_driver = :poltergeist
# :poltergeist
# browser = Capybara.current_session
# browser.visit "10.0.0.1"
# browser.visit "http://10.0.0.1"
# browser.find("#loginUsername")
# => #<Capybara::Node::Element tag="input" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[2]/DIV[1]/FORM[1]/DIV[3]/INPUT[1]">
#  browser.fill_in "loginUsername", with: "admin"
# => #<Capybara::Node::Element tag="input" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[2]/DIV[1]/FORM[1]/DIV[3]/INPUT[1]">
# browser.fill_in "loginPassword", with: "password"
# => #<Capybara::Node::Element tag="input" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[2]/DIV[1]/FORM[1]/DIV[4]/INPUT[1]">
# browser.click_on "Log In"
# => #<Capybara::Node::Element:0x3fd875c95738>
# browser.current_url
# => "http://10.0.0.1/at_a_glance.asp"


# # attempt 2 ~O
# Require the gems
require 'capybara/poltergeist'

# Configure Poltergeist to not blow up on websites with js errors aka every website with js
# See more options at https://github.com/teampoltergeist/poltergeist#customization
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

# Configure Capybara to use Poltergeist as the driver
Capybara.default_driver = :poltergeist


require 'capybara'
=> true
[2] pry(main)> require 'capybara/poltergeist'
=> true
[3] pry(main)> Capybara.register_driver :poltergeist do |app|
[3] pry(main)*   Capybara::Poltergeist::Driver.new(app, js_errors: false)
[3] pry(main)* end
=> #<Proc:0x007ffc779f0080@(pry):3>
[4] pry(main)> Capybara.default_driver = :poltergeist
=> :poltergeist
[5] pry(main)> browser = Capybara.current_session
=> #<Capybara::Session>
[6] pry(main)> browser.visit "http://10.0.0.1"
=> {"status"=>"success"}
[9] pry(main)> browser.fill_in('loginUsername', with: 'admin')
=> #<Capybara::Node::Element tag="input" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[2]/DIV[1]/FORM[1]/DIV[3]/INPUT[1]">
[10] pry(main)> browser.fill_in('loginPassword', with: 'password')
=> #<Capybara::Node::Element tag="input" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[2]/DIV[1]/FORM[1]/DIV[4]/INPUT[1]">
[11] pry(main)> browser.click_button('Log In')
=> #<Capybara::Node::Element:0x3ffe3bd84fcc>
(pry) output error: #<NoMethodError: undefined method `[]=' for nil:NilClass>
[12] pry(main)> browser.current_url
=> "http://10.0.0.1/at_a_glance.asp"
[14] pry(main)> browser.click_link('View Connected Devices')
=> #<Capybara::Node::Element:0x3ffe3b753cc0>
(pry) output error: #<NoMethodError: undefined method `[]=' for nil:NilClass>
[15] pry(main)> browser.current_url
=> "http://10.0.0.1/connected_devices_computers.asp"
[16] pry(main)> browser.save_screenshot
=> "/Users/Vesper/Documents/RobotMermaid/MarcoPolo/capybara-201703071435328091849221.png"
[17] pry(main)> browser.save_and_open_page
=> #<Process::Waiter:0x007ffc77c42680 sleep>
[18] pry(main)> links= browser.all 'a u'
#<Capybara::Node::Element tag="u" path="//HTML[1]/BODY[1......
pry(main)> links.first
=> #<Capybara::Node::Element tag="u" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[2]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/A[1]/U[1]">
[20] pry(main)> links.first.text
=> "WNR2000v4"
[22] pry(main)> links.last.text
=> "raspberrypi"

[29] pry(main)> browser.go_back
=> true
[30] pry(main)> browser.current_url
=> "http://10.0.0.1/at_a_glance.asp"
[31] pry(main)> browser.save_and_open_page
=> #<Process::Waiter:0x007ffc77aaac00 sleep>
[32] pry(main)> deviceList = browser.find_by_id("internet-usage")
=> #<Capybara::Node::Element tag="div" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]">
[33] pry(main)> deviceList
=> #<Capybara::Node::Element tag="div" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]">
[34] pry(main)> devices = browser.within(deviceList) {browser.all 'span.readonlyLabel'}
=> [#<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[1]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[2]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[3]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[4]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[5]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[6]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[7]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[8]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[9]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[10]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[11]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[12]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[13]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[14]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[15]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[16]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[17]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[18]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[19]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[20]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[21]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[22]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[23]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[24]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[25]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[26]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[27]/SPAN[2]">]
[35] pry(main)> devices.first
=> #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[1]/SPAN[2]">
[36] pry(main)> devices.last
=> #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[27]/SPAN[2]">

[38] pry(main)> firstDevice= devices.first
=> #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[1]/SPAN[2]">
[39] pry(main)> firstDevice.text
=> "WNR2000v4"

[42] pry(main)> deviceList = []
=> []
[43] pry(main)> devices.each do |name|
[43] pry(main)*   nameText = name.text
[43] pry(main)*   deviceList << nameText
[43] pry(main)* end
=> [#<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[1]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[2]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[3]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[4]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[5]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[6]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[7]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[8]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[9]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[10]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[11]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[12]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[13]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[14]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[15]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[16]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[17]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[18]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[19]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[20]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[21]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[22]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[23]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[24]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[25]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[26]/SPAN[2]">, #<Capybara::Node::Element tag="span" path="//HTML[1]/BODY[1]/DIV[1]/DIV[2]/DIV[3]/DIV[3]/DIV[27]/SPAN[2]">]

[45] pry(main)> deviceList
=> ["WNR2000v4",
 "android-f91fefc76578edbd",
 "lt-prangel-mac01",
 "Pauls-iPhone",
 "happy",
 "themastrchez-PC",
 "tw-mbp-paulrangel",
 "Minutia",
 "morbius",
 "lt-prangel-mac01",
 "HouseOferssiPod",
 "ItsAllGreens-PC",
 "gort",
 "10.0.0.16",
 "raspberrypi",
 "mbgua-laptop",
 "Ondine",
 "raspberrypi",
 "Shirka",
 "raspberrypi",
 "kindle-257d73559",
 "iPhone-5s",
 "DESKTOP-3121C06",
 "Mayas-Iphone",
 "android-8deef024416bad2",
 "android-981baeac7c9f8edb",
 "raspberrypi"]
