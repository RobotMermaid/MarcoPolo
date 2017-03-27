Message 34:
From Vesper@Minutia.local  Fri Mar 24 11:40:35 2017
X-Original-To: Vesper
Delivered-To: Vesper@Minutia.local
From: Vesper@Minutia.local (Cron Daemon)
To: Vesper@Minutia.local
Subject: Cron <Vesper@Minutia> /bin/bash -l -c 'ruby Documents/RobotMermaid/MarcoPolo/marcoPolo.rb'
X-Cron-Env: <SHELL=/bin/sh>
X-Cron-Env: <PATH=/usr/bin:/bin>
X-Cron-Env: <LOGNAME=Vesper>
X-Cron-Env: <USER=Vesper>
X-Cron-Env: <HOME=/Users/Vesper>
Date: Fri, 24 Mar 2017 11:40:01 -0700 (PDT)

ohai
/Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/web_socket_server.rb:99:in `rescue in send': Timed out waiting for response to {"id":"1df08476-bf1d-4429-ad1d-764c6fd85979","name":"click","args":[1,2]}. It's possible that this happened because something took a very long time (for example a page load was slow). If so, setting the Poltergeist :timeout option to a higher value will help (see the docs for details). If increasing the timeout does not help, this is probably a bug in Poltergeist - please report it to the issue tracker. (Capybara::Poltergeist::TimeoutError)
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/web_socket_server.rb:95:in `send'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/server.rb:38:in `send'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/browser.rb:369:in `command'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/browser.rb:192:in `click'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/node.rb:17:in `command'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/node.rb:131:in `click'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/capybara-2.12.1/lib/capybara/node/element.rb:143:in `block in click'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/capybara-2.12.1/lib/capybara/node/base.rb:85:in `synchronize'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/capybara-2.12.1/lib/capybara/node/element.rb:143:in `click'
        from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/capybara-2.12.1/lib/capybar:



Message 77:
From Vesper@Minutia.local  Fri Mar 24 23:30:06 2017
X-Original-To: Vesper
Delivered-To: Vesper@Minutia.local
From: Vesper@Minutia.local (Cron Daemon)
To: Vesper@Minutia.local
Subject: Cron <Vesper@Minutia> /bin/bash -l -c 'ruby Documents/RobotMermaid/MarcoPolo/marcoPolo.rb'
X-Cron-Env: <SHELL=/bin/sh>
X-Cron-Env: <PATH=/usr/bin:/bin>
X-Cron-Env: <LOGNAME=Vesper>
X-Cron-Env: <USER=Vesper>
X-Cron-Env: <HOME=/Users/Vesper>
Date: Fri, 24 Mar 2017 22:30:01 -0700 (PDT)

ohai
/Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/browser.rb:376:in `command': Request to 'http://10.0.0.1' failed to reach server, check DNS and/or server status - Timed out with the following resources still waiting http://10.0.0.1/global.css,http://10.0.0.1/jquery-1.3.2.min.js,http://10.0.0.1/jquery.validate.min.js,http://10.0.0.1/jquery.alerts.js,http://10.0.0.1/global.js,http://10.0.0.1/tch_global.js (Capybara::Poltergeist::StatusFailError)
	from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/browser.rb:35:in `visit'
	from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/poltergeist-1.13.0/lib/capybara/poltergeist/driver.rb:97:in `visit'
	from /Users/Vesper/.rvm/gems/ruby-2.3.1/gems/capybara-2.12.1/lib/capybara/session.rb:252:in `visit'
	from Documents/RobotMermaid/MarcoPolo/marcoPolo.rb:27:in `<main>'
