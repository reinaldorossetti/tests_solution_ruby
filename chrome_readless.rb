require 'selenium-webdriver'

# precisa incluir os matchers e a biblioteca.
# para fazer o assert com expect
require 'rspec/expectations'
include RSpec::Matchers

# instancia o driver do chrome passando os argumentos para executar em modo headless.
driver = Selenium::WebDriver.for :chrome, :switches => ["--headless", "--disable-gpu"]
driver.get("http://sandbox.clinicwise.net")
expect(driver.title).to eq("Wise Clinic")
puts driver.title
driver.quit
