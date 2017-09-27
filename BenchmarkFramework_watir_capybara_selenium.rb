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
      session = Capybara::Session.new(:selenium)
      Capybara.default_max_wait_time = 30
      session.visit('http://bit.ly/watir-webdriver-demo')
      session.fill_in("entry_1000000", :with => 'FrameWorks Testes')
      session.fill_in("entry_1000000", :with => '1234567890')
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
      driver = Watir::Browser.start 'bit.ly/watir-webdriver-demo', :firefox
      driver.text_field(id: "entry_1000000").exists?
      driver.text_field(id: "entry_1000000").send_keys 'FrameWorks Testes'
      driver.text_field(id: "entry_1000000").clear
      driver.text_field(id: "entry_1000000").send_keys '1234567890'
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
      driver = Selenium::WebDriver.for :firefox
      driver.navigate.to 'http://bit.ly/watir-webdriver-demo'

      def wait_for(seconds=30)
        Selenium::WebDriver::Wait.new(:timeout => seconds).until {yield}
      end

      wait_for {driver.find_element(id: "entry_1000000")}
      driver.find_element(id: "entry_1000000").send_keys 'FrameWorks Testes'
      driver.find_element(id: "entry_1000000").clear
      driver.find_element(:id, "entry_1000000").send_keys '1234567890'
      dropDownMenu = wait_for {driver.find_element(id: "entry_1000001")}
      options = Selenium::WebDriver::Support::Select.new(dropDownMenu)
      options.select_by(:text, "Ruby")
      driver.find_element(id: "group_1000003_1").click
      driver.find_element(id: "group_1000004_1").click
      driver.find_element(:name, 'submit').click
      driver.quit
    end
  end
end

