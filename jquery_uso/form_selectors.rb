require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome )
end

$session = Capybara::Session.new(:chrome)
$session.visit('https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_onmouseover')
$session.driver.browser.switch_to.frame ("iframeResult")

def trigger_event(elem, evento)
  dir_atual = File.expand_path File.dirname(__FILE__)
  query = elem.instance_variable_get(:@query).locator
  js = File.read("#{dir_atual}/jquery.min.js")
  $session.execute_script(js)
  $session.execute_script("$(arguments[0]).trigger(\"#{evento}\")", elem)
end

elem = $session.find("img[onmouseover*=bigImg]")
trigger_event(elem, "mouseover")

sleep 10 # somente para ver o elemento sumindo.
$session.close
