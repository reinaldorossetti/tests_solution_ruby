class Capybara::Session
  def execute_script(script, *args)
    @touched = true
    driver.execute_script(script, *args)
  end

  def evaluate_script(script, *args)
    @touched = true
    driver.evaluate_script(script, *args)
  end
end

class Capybara::Selenium::Driver
  def execute_script(script, *args)
    browser.execute_script(script, *args)
  end

  def evaluate_script(script, *args)
    browser.execute_script("return #{script}", *args)
  end
end
