        def wait_for_alert
          wait = Wait.new(timeout: 5, ignore: Error::NoAlertPresentError)
          wait.until { driver.switch_to.alert }
        end

        def wait_for_no_alert
          wait = Wait.new(timeout: 5, ignore: Error::UnhandledAlertError)
          wait.until { driver.title }
        end

        def wait_for_element(locator)
          wait = Wait.new(timeout: 25, ignore: Error::NoSuchElementError)
          wait.until { driver.find_element(locator) }
        end
