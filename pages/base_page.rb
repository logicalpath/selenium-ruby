# frozen_string_literal: true

# filename: pages/base_page.rb
# BasePage is used by all pages
class BasePage
  def initialize(driver)
    @driver = driver
  end

  def navigate_to(url)
    @driver.navigate.to url
  end

  def get(url)
    @driver.get url
  end

  def visit(url_path)
    @driver.get ENV['BASE_URL'] + url_path
  end

  def find(locator)
    @driver.find_element locator
  end

  def get_element_text(locator)
    find(locator).text
  end

  def valuepresent?(locator)
    element = find(locator)
    !element.attribute('value').empty?
  end

  def type(text, locator)
    find(locator).send_keys text
  end

  def send_return(locator)
    find(locator).send_keys(:return)
  end

  def click(locator)
    find(locator).click
  end

  def rightclick(locator)
    @driver.action.context_click(find(locator)).perform
  end

  def displayed?(locator)
    find(locator).displayed?
  rescue StandardError
    false
  end

  def wait_for(seconds = 15)
    Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  end
end
