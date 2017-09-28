# * Inicia o Browser.
# * Navega para o site watir-webdriver-demo form.
# * Verifica se o campo texto estah visivel.
# * Envia um texto para o campo.
# * Envia numeros para o campo.
# * Seleciona a opcao 'Ruby' no select list.
# * Dar o clique no radio button.
# * Dar o clique no checkbox.
# * Dar o clique no Submit button

require 'benchmark'
include Benchmark
iterations = 5

Benchmark.bm do |bm|
  puts "capybara"
  bm.report do
    iterations.times do
      require 'capybara'

      Capybara.register_driver :chrome do |app|
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
      end

      session = Capybara::Session.new(:chrome)
      session.visit('http://bit.ly/watir-webdriver-demo')
      session.fill_in("entry_1000000", :with => '8wUFjPi5eJRiKwnbAf92FBpgJfSLYUTPGFxtT3mnunTmkJsClS4pMWoSKqqJjP3l1AZbLQHi8wEioEXwr1aylWqdzKhnoFOj5HQKUXJv5iVcUF4ZnvKYfHo4Nlt7zQ5aGLi6gwVsRhStw6L066Mko1otZe2akqKsHlCLlx6QtrPoKffeTdlI4l66D83KQ161iIOSv6km')
      session.select('Ruby', :from => "entry_1000001")
      session.find_by_id("group_1000003_1").click
      session.find_by_id("group_1000004_1").click
      session.click_button 'Enviar'
      session.driver.browser.quit
    end
  end

  puts "watir"
  bm.report do
    iterations.times do
      require 'watir'
      driver = Watir::Browser.start 'http://bit.ly/watir-webdriver-demo', :chrome
      driver.text_field(id: "entry_1000000").send_keys '8wUFjPi5eJRiKwnbAf92FBpgJfSLYUTPGFxtT3mnunTmkJsClS4pMWoSKqqJjP3l1AZbLQHi8wEioEXwr1aylWqdzKhnoFOj5HQKUXJv5iVcUF4ZnvKYfHo4Nlt7zQ5aGLi6gwVsRhStw6L066Mko1otZe2akqKsHlCLlx6QtrPoKffeTdlI4l66D83KQ161iIOSv6km'
      driver.select_list(id: "entry_1000001").select 'Ruby'
      driver.radio(id: "group_1000003_1").click
      driver.checkbox(id: "group_1000004_1").click
      driver.button(name: 'submit').click
      driver.quit
    end
  end

  puts "'watir-webdriver"
  bm.report do
    iterations.times do
      require 'watir-webdriver'
      driver = Watir::Browser.start 'http://bit.ly/watir-webdriver-demo', :chrome
      driver.text_field(id: "entry_1000000").send_keys '8wUFjPi5eJRiKwnbAf92FBpgJfSLYUTPGFxtT3mnunTmkJsClS4pMWoSKqqJjP3l1AZbLQHi8wEioEXwr1aylWqdzKhnoFOj5HQKUXJv5iVcUF4ZnvKYfHo4Nlt7zQ5aGLi6gwVsRhStw6L066Mko1otZe2akqKsHlCLlx6QtrPoKffeTdlI4l66D83KQ161iIOSv6km'
      driver.select_list(id: "entry_1000001").select 'Ruby'
      driver.radio(id: "group_1000003_1").click
      driver.checkbox(id: "group_1000004_1").click
      driver.button(name: 'submit').click
      driver.quit
    end
  end

  puts "selenium-webdriver"
  bm.report do
    iterations.times do
      require 'selenium-webdriver'
      driver = Selenium::WebDriver.for :chrome
      driver.navigate.to 'http://bit.ly/watir-webdriver-demo'

      def wait_for(seconds=30)
        Selenium::WebDriver::Wait.new(:timeout => seconds).until {yield}
      end

      elem = wait_for {driver.find_element(id: "entry_1000000")}
      elem.send_keys '8wUFjPi5eJRiKwnbAf92FBpgJfSLYUTPGFxtT3mnunTmkJsClS4pMWoSKqqJjP3l1AZbLQHi8wEioEXwr1aylWqdzKhnoFOj5HQKUXJv5iVcUF4ZnvKYfHo4Nlt7zQ5aGLi6gwVsRhStw6L066Mko1otZe2akqKsHlCLlx6QtrPoKffeTdlI4l66D83KQ161iIOSv6km'

      dropDownMenu = wait_for {driver.find_element(id: "entry_1000001")}
      options = Selenium::WebDriver::Support::Select.new(dropDownMenu)
      options.select_by(:text, "Ruby")

      elem = wait_for {driver.find_element(id: "group_1000003_1")}
      elem.click

      elem = wait_for {driver.find_element(id: "group_1000004_1")}
      elem.click

      elem = wait_for {driver.find_element(:name, 'submit')}
      elem.click
      driver.quit
    end
  end
end

