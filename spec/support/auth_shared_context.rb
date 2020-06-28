# frozen_string_literal: true

# filename: spec/support/auth_shared_context.rb
require_relative '../../utils/helper'

shared_context 'somethng each' do
  before(:each) do
    # something
  end
end

shared_context 'create user' do
  before(:each) do
    @user = create_user
  end
end

shared_context 'something all' do
  before(:all) do
    # something all
  end
end

shared_context 'theinternet user' do
  before(:each) do
    @account = create_theinternet
  end
end
