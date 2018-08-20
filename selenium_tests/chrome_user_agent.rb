require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  args = []
  args << "--window-size=320,480"
  args << "--user-agent='Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'"
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :args => args)
end

session = Capybara::Session.new(:chrome)

session.visit("https://www.w3schools.com/cssref/tryit.asp?filename=trycss_sel_hover")
session.find('#iframeResult')
p session.evaluate_script("navigator.userAgent")
