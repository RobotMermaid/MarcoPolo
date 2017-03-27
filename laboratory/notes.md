http://10.0.0.1/at_a_glance.asp


###Capybara   
* https://gist.github.com/zhengjia/428105  
* http://tutorials.jumpstartlab.com/topics/scraping-with-capybara.html  
* http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara  

###raspberrypi
* https://learn.adafruit.com/adafruits-raspberry-pi-lesson-3-network-setup/setting-up-wifi-with-occidentalis  

still need to figure out how to get MarcoPolo onto the pi
* crontab
* ruby: http://rayhightower.com/blog/2012/12/03/ruby-on-raspberry-pi/
* capybara: https://github.com/wrightmhw/SpotifyAlarm
* file - deviceList

find ip address on the router 10.0.0.1
ssh pi@192.168.1.13 (whichever ip address the router gives you)
password is raspberrypi
to logout: exit
there is a marcoPolo folder in Documents

Paul found this:
// nokogiri requires Ruby >= 2.1.0

sudo apt-get update
sudo apt-get upgrade

ruby --version

// if you have >= 2.1.0 then you don't need rvm

curl -L https://get.rvm.io | bash -s stable --ruby

source ~/.rvm/scripts/rvm


sudo gem install capybara


wilson
https://rvm.io/rvm/install
\curl -sSL https://get.rvm.io | bash
source /home/pi/.rvm/scripts/rvm
rvm install 2.4

<!-- ERROR:  Error installing capybara:
	rack requires Ruby version >= 2.2.2. -->
  <!--ruby -v => ruby 2.4.1p111 (2017-03-22 revision 58053) [armv7l-linux-eabihf] -->
  system ruby vs implementation ruby?

  Quick test: the output of sudo ruby -v
  <!-- ruby 2.1.5p273 (2014-11-13) [arm-linux-gnueabihf]
 -->
  sudo is the super user and more conservative
  leave off the sudo in gem install

rvm install 2.2.2

reinstalled capybara phantomjs poltergeist in marcopolo folder on pi
must relogin to load those!!

phantomjs is listed as a gem but
<!-- failed to detect the version of the executable at '/usr/bin/phantomjs' -->
phantomjs --version  returns nothing
uninstalled phantomjs with apt-get in sudo
installed node
installed npm
tried to install phantom from npm = no success
phantomjs is deprecated?! phantomjs-prebuilt



<!-- ******************* -->
is my pi a  Raspberry Pi 2 B ARM Cortex A-7 processor?
binaries available are for different kind
cat /proc/cpuinfo =>
processor: 0
model name	: A Processor rev 5 (v7l)
BogoMIPS	: 38.40
Features	: half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm
CPU implementer	: 0x41
CPU architecture: 7
CPU variant	: 0x0
CPU part	: 0xc07
CPU revision	: 5

Hardware	: BCM2709
Revision	: a21041
Serial		: 00000000f55b37ea

release date: Q1 2015
model: 2 Model B
PCB revision: 1.1
memory: 1 GB
(Mfg by Embest)
http://elinux.org/RPi_HardwareHistory#Board_Revision_History


// on laptop
<!-- -O, --remote-name
       Write output to a local file named like the remote file we  get.
       (Only  the file part of the remote file is used, the path is cut
       off.) -->
curl -O https://github.com/fg2it/phantomjs-on-raspberry/releases/download/v2.1.1-wheezy-jessie/phantomjs_2.1.1_armhf.deb

scp phantomjs_2.1.1_armhf.deb pi@10.0.0.19:

// on pi

sudo dpkg -i phantomjs_2.1.1_armhf.deb

source ~/.bash

phantomjs —version


https://github.com/fg2it/phantomjs-on-raspberry/releases/tag/v2.1.1-wheezy-jessie


###crontab  
* https://crontab.guru/tips.html  
* https://linuxacademy.com/blog/linux/the-cron-daemon/  
  was simpler than instructions  
in terminal   
  ``  env EDITOR=nano crontab -e  ``  
in crontab  
  ``*/5 * * * * /bin/bash -l -c 'ruby Documents/RobotMermaid/MarcoPolo/marcoPolo.rb'``    
had to wrap the ruby ``/bin/bash -l -c``  
which means run thru bash script (from man bash)
-l :Makes bash act as if it had been invoked as a login shell  
-c string If  the  -c  option  is  present, then commands are read from
                 string.  If there are arguments after the  string,  they  are
                 assigned to the positional parameters, starting with $0.
no space in ``*/5`  
``/bin/bash`` the shell it should run in  

on the pi
*/5 * * * * /bin/bash -l -c 'cd ~/Documents/MarcoPolo/ ; ruby marcoPolo.rb'

###File   
* https://ruby-doc.org/core-2.2.0/File.html    
``File.open('devicesNow.json', 'w') { |file| file.write(deviceList.to_json) }``  

###IFTTT  
no docs!! https://platform.ifttt.com/docs
had to find the Maker applet and configure that:  
in My Applets must go to new applet button and click on the blue '+this' text
search for maker and from there settings to get link
the curl code came straight from the maker.ifttt.com settings
can't get the email_string in value to format right -> bad request


##the Entelechy aka IRL  
the iphones seem to hop on and off the network
mbigua appeared on the network at 12:05AM off at 1:40AM on at 2:05AM!?  
If Wi-Fi Assist is left activated, your iPhone will automatically use cellular data whenever it finds that a Wi-Fi router signal is weak - Open the "settings" app on your home screen, tap on the "cellular" tab, and scroll down to the very bottom of the list. There you'll see a toggle for "Wi-Fi Assist." Flick it off.
