# frozen_string_literal: true

# filename: utils/selenium_helper.rb

def create_driver
  case ENV['BROWSER']
  when 'firefox'
    options = Selenium::WebDriver::Firefox::Options.new
    if ENV['BROWSER_MODE'] == 'headless'
      options.add_argument('-headless')
      options.add_argument('window-size=1920,1080')
    end
    @driver = Selenium::WebDriver.for :firefox, options: options, driver_path: ENV['WDRIVER_PATH']
  when 'chrome'
    options = Selenium::WebDriver::Chrome::Options.new
    if ENV['BROWSER_MODE'] == 'headless'
      options.add_argument('--no-sandbox')
      options.add_argument('--remote-debugging-port=9222')
      options.add_argument('--disable-dev-shm-usage')
      options.add_argument('--disable-extensions')
      options.add_argument('--headless')
      options.add_argument('--single-process')
      options.add_argument('window-size=1920,1080')
    end
    @driver = Selenium::WebDriver.for :chrome, options: options, driver_path: ENV['WDRIVER_PATH']
  end
end

def destroy_driver
  @driver.quit
end
