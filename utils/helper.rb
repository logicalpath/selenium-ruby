# frozen_string_literal: true

# filename: utils/helper.rb
require 'faraday'
require 'faraday_middleware'
require 'pathname'
require 'yaml'
require 'faker'
require 'json'
require 'csv'

def random_locale
  locale_array = %w[fr en es ja ar de]
  locale_array.sample
end

def write_csv_file(rows:, location:)
  CSV.open(location, 'w') do |file|
    rows.each do |row|
      file << row
    end
  end
end

def write_file(contents:, location:)
  File.open(location, 'w+') do |c|
    c.puts(contents)
  end
end

def log_jsconsole
  js_console_log = @driver.manage.logs.get :browser
  entries = []
  js_console_log.each do |each|
    entries << each.message
    entries << each.timestamp
  end
  entries
end

def log_person(person:, person_details:)
  log_array = []
  log_header = %w[EMAIL PASSWORD NAME]
  log_array << log_header
  log_row = []
  log_row << person_details[:email]
  log_row << person_details[:psswd]
  log_row << person_details[:name]
  log_array << log_row

  write_csv_file(rows: log_array, location: "artifacts/#{person}")
end

def should_take_screenshots?
  ENV['SCREENSHOTS'] == 'yes'
end

# TODO: parameterize this
def parse_cookie_element(element:)
  a = element.split(/%22/)
  i = a.rindex('locale')
  return nill unless i

  a[i + 2]
end

def create_user
  { name: Faker::Name.name, email: Faker::Internet.email, psswd: Faker::Internet.password(8, 8), locale: 'en', role: 'user' }
end

# login.with_("tomsmith", "SuperSecretPassword!")

def create_theinternet
  { name: 'tomsmith', email: 'tomsmith', psswd: 'SuperSecretPassword!', locale: 'en', role: 'user' }
end

def get_resp(conn:, api:)
  conn.get do |req|
    req.url api.to_s
  end
end
