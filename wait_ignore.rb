        def wait_for_alert
          wait = Wait.new(timeout: 5, ignore: Error::NoAlertPresentError)
          wait.until { driver.switch_to.alert }
        end

        def wait_for_no_alert
          wait = Wait.new(timeout: 5, ignore: Error::UnhandledAlertError)
          wait.until { driver.title }
        end

        def wait_for_alert
           wait = Selenium::WebDriver::Wait.new ignore: Selenium::WebDriver::Error::NoAlertPresentError
           alert = wait.until { @driver.switch_to.alert }
           alert
        end
