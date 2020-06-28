# frozen_string_literal: true

# filename: spec/spec_helper.rb
#
require 'selenium-webdriver'
require 'axe/rspec'
require_relative '../utils/helper'
require_relative '../utils/selenium_helper'
require_relative 'support/auth_shared_context'
require_relative 'support/auth_shared_examples'

require 'pry'

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'artifacts/example-status.txt'
  config.filter_run_excluding broken: true

  config.before(:each) do
    create_driver
  end

  config.after(:each) do |x|
    if x.exception
      # TODO: Add a timestamp to filename for uniqueness
      @driver.save_screenshot("artifacts/#{x.example_group.to_s.gsub('::', '_')}.png") if should_take_screenshots?
      if ENV['BROWSER'] == 'chrome'
        js_console_errors = log_jsconsole
        write_file(contents: js_console_errors, location: "artifacts/#{x.example_group.to_s.gsub('::', '_')}_jsconsole")
      end
    end

    destroy_driver
  end
end
