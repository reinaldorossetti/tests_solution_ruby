require 'selenium-webdriver'
require 'rspec'

include RSpec::Matchers

driver = Selenium::WebDriver.for :chrome

driver.get("http://www.google.com.br")

driver.manage.timeouts.implicit_wait = 10  # espera implicita de 10 segundos.

# faz a busca novamente após a ação.
element = driver.find_element(id: "lst-ib")

# faz a ação
element.send_key "Blog vida de testador"

# somente pra saber se enviou.
p element[:value] # python não faz invocar um Simbolo/name interno.

# dessa forma voce faz direto via o nome do elemento, sem precisar colocar o input[name=btnK].
element02 = driver.find_element(name: "btnK")

# pega a cor do elemento button.
p color = element02.css_value("color") # uma coisa q python não faz receber e imprimir o valor

# verifica se realizou o teste com sucesso.
expect(color).to eql "rgba(117, 117, 117, 1)"

# pedir pro browser sair.
driver.quit()
