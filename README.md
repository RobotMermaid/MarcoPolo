# MarcoPolo
An app that tells you who's home through the router

# Summary  
Devices can be used to monitor the activity of people in an environment. This tool will monitor the attached devices and provide a notification system. This will be first used to make requests to web APIs and later to connect to other IoT displays.  

# Goals  
Monitor network attached devices via Ruby webserver on a raspberry pi. When a device is added or removed from the network send notifications to configured APIs.


# Process  
* Capybara with phantomjs to navigate the webpage
* Ruby file for the code
* yaml for config
* Cron to run the ruby file every 5 minutes
* IFTTT.com to send a email when a change was detected
* raspberrypi to house the project
