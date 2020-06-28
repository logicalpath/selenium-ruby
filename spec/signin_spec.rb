# frozen_string_literal: true

# filename: spec/signin_spec.rb
require 'spec_helper'
require_relative '../pages/signin'

describe 'Auth' do
  describe 'Signin' do
    before(:each) do
      @signin = Signin.new(@driver)
    end

    context 'with valid creds' do
      include_context 'theinternet user'
      let(:account_type) { 'user' }
      @the_locale = 'en'

      it_should_behave_like 'login user'
    end

    context 'with invalid creds' do
      it 'should fail', :second do
        @signin.set_inputs_and_submit(username: 'blahblah', password: 'blahhhhh')
        expect(@signin.failure_message_present?).to eql true
      end
    end
  end
end
