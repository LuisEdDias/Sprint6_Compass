require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'pry'

ENVIRONMENT = ENV['ENVIRONMENT']
ENVIRONMENT_CONFIG = YAML.load_file(File.dirname(__FILE__) + "/environments/#{ENVIRONMENT}.yml")
URL = ENVIRONMENT_CONFIG['url']

SELENIUM_WAIT = Selenium::WebDriver::Wait.new(timeout: 10)

Capybara.register_driver :my_chrome do |app|
    options = Selenium::WebDriver::Options.chrome
    
    options.args << '--ignore-ssl-errors'
    options.args << '--disable-popup-blocking'
    options.args << '--disable-gpu'
    options.args << '--disable-translate'
    options.args << '--acceptInsecureCerts=true'
    options.args << '--incognito'
    options.args << '--start-maximized'
    options.args << '--disable-site-isolation-trials'

    if ENV['HEADLESS']
        options.args << '--headless'
    end

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :my_edge do |app|
    options = Selenium::WebDriver::Options.edge
    
    options.args << '--ignore-ssl-errors'
    options.args << '--disable-popup-blocking'
    options.args << '--disable-gpu'
    options.args << '--disable-translate'
    options.args << '--acceptInsecureCerts=true'
    options.args << '--start-maximized'
    options.args << '--inprivate'
    options.args << '--disable-site-isolation-trials'
    options.args << '--disable-infobars'
  
    if ENV['HEADLESS']
        options.args << '--headless'
    end
  
    Capybara::Selenium::Driver.new(app, browser: :edge, options: options)
end

Capybara.register_driver :my_firefox do |app|
    options = Selenium::WebDriver::Options.firefox
    
    options.args << '--ignore-ssl-errors'
    options.args << '--disable-popup-blocking'
    options.args << '--disable-gpu'
    options.args << '--disable-translate'
    options.args << '--acceptInsecureCerts=true'
    options.args << '--private-window'
    options.args << '--start-maximized'
    options.args << '--disable-site-isolation-trials'
  
    if ENV['HEADLESS']
        options.args << '--headless'
    end

    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.register_driver :container_chrome do |app|
    options = Selenium::WebDriver::Options.chrome
    
    options.args << '--headless'
    options.args << '--ignore-ssl-errors'
    options.args << '--disable-popup-blocking'
    options.args << '--disable-gpu'
    options.args << '--disable-translate'
    options.args << '--acceptInsecureCerts=true'
    options.args << '--incognito'
    options.args << '--window-size=1920,1080'
    options.args << '--disable-site-isolation-trials'
    options.args << '--disable-dev-shm-usage'
  
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = ENV['BROWSER'].to_sym
Capybara.app_host              = URL
Capybara.default_max_wait_time = 10
