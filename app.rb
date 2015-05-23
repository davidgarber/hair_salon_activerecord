require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload('lib/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')
require('pry')

get('/') do
  erb(:index)
end
