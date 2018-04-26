require 'capybara'

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)

end

session = Capybara::Session.new(:firefox)

session.visit("https://www3.netcombo.com.br")

session.find("input[name=cidadePreHome]").send_keys "sao paulo"

session.find("button[name=isAssinante][value=\"0\"]").click

session.find("a[href*=\"MinhaNet\"] span").click
