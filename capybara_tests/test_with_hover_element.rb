require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

session = Capybara::Session.new(:firefox)
session.visit("https://www.w3schools.com/cssref/tryit.asp?filename=trycss_sel_hover")

session.within_frame('iframeResult'){
    element = session.find('a', :text => 'w3schools.com')
    # begin
    #   element.hover # primeira forma de dar o hover.
    # rescue
        session.driver.browser.action.move_to(element.native).perform
    # end  
  }

sleep 10