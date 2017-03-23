http://10.0.0.1/at_a_glance.asp

##a faire   
* yaml file to configure - done 
* get app on raspberry pi


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

###crontab  
* https://crontab.guru/tips.html  
  was simpler than instructions  
in terminal   
  ``env EDITOR=nano crontab -e``  
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
