# encoding: utf-8
require "capybara/dsl"

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.default_max_wait_time = 10

class HoverTest

  include Capybara::DSL

  def initialize
    visit "https://www.w3schools.com/cssref/tryit.asp?filename=trycss_sel_hover"
  end

  def check_hover_link

    # dentro do iframe seleciona o link
    within_frame('iframeResult', :visible=>true) do
      first('a', :visible => true).hover
    end
    
    sleep 5 # soh pra olhar a mudanca do hover
    
    # fora do iframe no menu principal
    elem = first('button', :text => 'Run »', :visible => true)
    elem.hover
    elem.click
  end

end

account = HoverTest.new
account.check_hover_link
sleep 10 # soh pra olhar a mudanca do hover
