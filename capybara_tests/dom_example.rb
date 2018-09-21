require 'capybara'
#require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_max_wait_time = 30
$session = Capybara::Session.new(:chrome)
$session.visit("https://erp1.edebe.com.br:8085/?StartProg=SIGAMDI&Comm=TCP&Env=P12_PROD")

def send_by_js(element, value)
  $session.driver.browser.execute_script("arguments[0].value='#{value.to_s}';", element.native )
end

elem01 = $session.find('#COMP3014 > input')
elem02 = $session.find('#COMP3016 > input')

send_by_js(elem01, "Reinaldo")
send_by_js(elem02, "rei123")

sleep 5  