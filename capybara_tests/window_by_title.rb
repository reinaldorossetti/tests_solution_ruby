require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

session = Capybara::Session.new(:firefox)
session.visit("http://www.google.com")
session.open_new_window
p session.windows
session.switch_to_window { session.title == '' }
p session.current_window
