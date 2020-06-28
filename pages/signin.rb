# frozen_string_literal: true

# filename: signin.rb
require_relative 'base_page'
# Signin is used to login to an app
class Signin < BasePage
  LOGIN_FORM = { id: 'login' }.freeze
  USERNAME_INPUT =  { id:  'username' }.freeze
  PASSWORD_INPUT =  { id:  'password' }.freeze
  SUBMIT_BUTTON  =  { css: 'button' }.freeze
  SUCCESS_MESSAGE = { css: '.flash.success' }.freeze
  FAILURE_MESSAGE = { css: '.flash.error' }.freeze

  def initialize(driver)
    super
    visit '/login'
    raise 'Login page not ready' unless
      @driver.find_element(LOGIN_FORM).displayed?
  end

  def set_inputs_and_submit(username:, password:)
    type_username(username: username)
    type_password(password: password)

    wait_for(3) { displayed? SUBMIT_BUTTON }
    click SUBMIT_BUTTON
  end

  def type_username(username:)
    wait_for(3) { displayed? USERNAME_INPUT }
    type username.to_s, USERNAME_INPUT
  end

  def type_password(password:)
    wait_for(3) { displayed? PASSWORD_INPUT }
    type password.to_s, PASSWORD_INPUT
  end

  def success_message_present?
    wait_for(5) { displayed? SUCCESS_MESSAGE }
  end

  def failure_message_present?
    wait_for(5) { displayed? FAILURE_MESSAGE }
  end
end
