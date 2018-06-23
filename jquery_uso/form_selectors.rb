require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome )
end

session = Capybara::Session.new(:chrome)
session.visit('https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_onmouseover')
session.driver.browser.switch_to.frame ("iframeResult")
elem = session.find("img[onmouseover*=bigImg]")
#elem.hover
dir_atual = File.expand_path File.dirname(__FILE__)
p dir_atual
query = elem.instance_variable_get(:@query).locator
js = File.read("#{dir_atual}/jquery.min.js")
session.execute_script(js)
session.execute_script("$('#{query}').trigger(\"mouseover\")")
sleep 10 # somente para ver o elemento sumindo.
session.close
