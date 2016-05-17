require 'rubygems'
require 'rspec/expectations'
require 'Capybara'
require 'json'
require "csv"
require "watir-webdriver"
require "rspec"
require "rspec/expectations"
require "selenium-webdriver"
require "watir-webdriver/wait"
require "capybara/cucumber"

Given /^that I am on (.*)$/ do |page|
  BROWSER.goto(PAGES[page])
end

begin
	if ENV['Browser'] == 'firefox'
		Capybara.register_driver :selenium_firefox do |app|
			Capybara::Selenium::Driver.new(app, :browser => :firefox)
		end
		Capybara.default_driver         = :selenium_firefox
		Capybara.javascript_driver      = :selenium_firefox
		Capybara.run_server             = false
		Capybara.default_selector       = :css
		Capybara.default_max_wait_time = 30
	elsif ENV['Browser'] == 'ie'
		Capybara.register_driver :ie do |app|
			Capybara::Selenium::Driver.new(app, :browser => :ie)
		end
		Capybara.default_driver = :ie
		Capybara.default_max_wait_time = 90
	else 
		Capybara.register_driver :chrome do |app|
			Capybara::Selenium::Driver.new(app, :browser => :chrome, :switches => %w[ --disable-extensions ])
		end
		Capybara.default_driver = :chrome
		Capybara.default_max_wait_time = 45
	end
end

Capybara.app_host = "https://login.salesforce.com/"

ENV['TEST_ENV'] = 'Test'

def env
  case ENV['TEST_ENV']
  
    when /Test/   then "https://login.salesforce.com/"
  else
      "https://login.salesforce.com/"
  end
end

