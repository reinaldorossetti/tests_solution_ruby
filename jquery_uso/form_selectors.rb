require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome )
end

$browser = Capybara::Session.new(:chrome)
$browser.visit('https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_onmouseover')
$browser.driver.browser.switch_to.frame ("iframeResult")

def trigger_event(elem, evento)
  dir_atual = File.expand_path File.dirname(__FILE__) # pega o caminho do arquivo
  query = elem.instance_variable_get(:@query).locator
  js = File.read("#{dir_atual}/jquery.min.js") # ler o arquivo jquery
  $browser.execute_script(js)
  $browser.execute_script("$(arguments[0]).trigger(\"#{evento}\")", elem)
end

elem = $browser.find("img[onmouseover*=bigImg]")
trigger_event(elem, "mouseover")

sleep 10 # somente para ver o elemento sumindo.
$browser.close
