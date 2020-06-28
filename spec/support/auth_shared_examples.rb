# frozen_string_literal: true

# filename: spec/support/auth_shared_examples.rb
require 'spec_helper'
require_relative '../../utils/helper'

shared_examples 'login user' do
  it 'should login user with valid creds' do
    #       if @account == nil
    #        fail "person not created"
    #      end
    @signin.set_inputs_and_submit(username: @account[:email], password: @account[:psswd])
    expect(@signin.success_message_present?).to eql true
  end
end
