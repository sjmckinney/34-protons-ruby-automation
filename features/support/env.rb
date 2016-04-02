require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'site_prism'

# if there is a command line argument
# use that to determine the browser to use
# else default to Firefox
# Acceptable values are chrome, ie


browser = :firefox

Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => browser)
end

# as we are running non rack tests
# turn off Capybara's racker server
Capybara.run_server = false

#Capybara.app_host = 'http://www.34protons.co.uk/demo_2_0'
#Capybara.app_host = 'http://localhost/~stephenmckinney/34protons'
Capybara.app_host = 'http://localhost/34protons'