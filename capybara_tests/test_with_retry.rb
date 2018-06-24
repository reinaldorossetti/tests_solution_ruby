require 'capybara'
require 'selenium-webdriver'
require 'rspec'
require 'benchmark'

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

$session = Capybara::Session.new(:firefox)
$session.visit("https://www.w3schools.com/cssref/tryit.asp?filename=trycss_sel_hover")
def mouse_sobre

  $session.within_frame('iframeResult', :visible=>true){
    count = 0
    begin
      $start = Time.now # inicia o time.
      p count += 1
      element = $session.find('a', :text => 'reinaldo', :visible => true)
      element.hover

    rescue => ex
        p ex
        p diff = Time.now - $start
        Capybara.default_max_wait_time = 10
        retry  if count < 4
    end  
    }
end

mouse_sobre
sleep 10