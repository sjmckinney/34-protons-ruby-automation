require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'dotenv'

Dotenv.load('.env')

# if there is a command line argument
# use that to determine the browser to use
# else default to Firefox
# Acceptable values are chrome, internet_explorer, firefox, edge

browser=ENV['browser']
platform=ENV['platform']
remote=ENV['remote']

begin

  raise ArgumentError, "Current browser_choice #{browser} is not valid: must be firefox, chrome, internet_explorer or edge" \
      unless ['firefox', 'chrome', 'internet_explorer', 'edge'].include?(browser)

rescue => e

   browser = 'firefox'
   $LOG.error(e.message)
   $LOG.error("Value of ENV['browser_choice'] supplied: #{browser} was invalid. Defaulted 'browser' to 'firefox'")

end

def create_driver(remote, browser, platform)

  browser_sym = browser.downcase.to_sym

  #puts "Is remote true?: #{remote.eql?('true').to_s}"

  if(remote.eql?('true'))

    create_remote_driver(browser_sym, platform)

  else

    create_local_driver(browser_sym)

  end

end

def create_remote_driver(browser, platform)

  if(browser == :firefox)
    caps = Selenium::WebDriver::Remote::Capabilities.firefox
    caps.javascript_enabled = true
    caps.css_selectors_enabled = true
    caps.takes_screenshot = true
    caps.platform = platform.to_sym
  elsif(browser == :chrome)
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    caps.javascript_enabled = true
    caps.css_selectors_enabled = true
    caps.takes_screenshot = true
    caps.platform = platform.to_sym
  elsif(browser == :internet_explorer)
    caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
    caps.platform = platform.to_sym
  elsif(browser == :edge)
      caps = Selenium::WebDriver::Remote::Capabilities.edge
      caps.platform = :WIN10
  else
      puts "Browser type #{browser} is not recognised."
  end

  Capybara.register_driver :selenium do |app|

    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 120 # instead of the default 60

    Capybara::Selenium::Driver.new(app,
                                   :browser => :remote,
                                   :url => ENV['hub'],
                                   :desired_capabilities => caps,
                                   :http_client => client)
  end

end

def create_local_driver(browser)

    Capybara.register_driver :selenium do |app|

      Capybara::Selenium::Driver.new(app, :browser => browser)

    end

end

# as we are running non rack tests
# turn off Capybara's racker server
Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = ENV['app_host']

create_driver(remote, browser, platform)
