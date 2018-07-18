require 'capybara'
require 'selenium-webdriver'

module CapybaraExtension
  def drag_by(right_by, down_by)
    base.drag_by(right_by, down_by)
  end
end

module CapybaraSeleniumExtension
  def drag_by(right_by, down_by)
    driver.browser.action.drag_and_drop_by(native, right_by, down_by).perform
  end
end

::Capybara::Selenium::Node.send :include, CapybaraSeleniumExtension
::Capybara::Node::Element.send :include, CapybaraExtension

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

session = Capybara::Session.new(:firefox)
session.visit("https://jqueryui.com/draggable/")

session.within_frame(0){
  origem = session.find('#draggable')
  origem.drag_by(50,100)
}

sleep 15