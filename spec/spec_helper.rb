ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('capybara/rspec')
require('rspec')
require('pg')
require('client')
require('stylist')
require('pry')

RSpec.configure do |config|
  config.after(:each) do
    Stylist.all().each do |stylist|
      stylist.destroy()
    end
    Client.all().each do |client|
      client.destroy()
    end
  end
end
