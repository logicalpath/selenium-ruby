# frozen_string_literal: true

# filename: local.rb

require 'rbconfig'

ENV['BROWSER_MODE'] ||= 'normal'
ENV['BASE_URL'] ||= 'http://localhost:9292'
ENV['BROWSER']  ||= 'chrome'
# ENV['BROWSER']  ||= 'firefox'
ENV['OPSYS'] ||= 'undefined'
ENV['SCREENSHOTS'] ||= 'yes'
ENV['WDRIVER_PATH'] ||= '/usr/bin/chromedriver'
# ENV['WDRIVER_PATH'] ||= '/usr/bin/geckodriver'

#
#   Determine OS
#
@os = RbConfig::CONFIG['host_os']

@os = if @os.downcase.include?('linux')
        'linux'
      elsif @os.downcase.include?('darwin')
        'mac'
      elsif @os.downcase.include?('mingw32')
        'windows'
      else
        'unknown'

      end

ENV['OPSYS'] = @os
