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

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylist_list)
end

post('/add_stylist') do
  name = params.fetch("name")
  Stylist.create({:name => name})
  @stylists = Stylist.all()
  erb(:stylist_list)
end

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch("id"))
  erb(:stylist_detail)
end

patch('/stylist/:id') do
  new_name = params.fetch('new_name')
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:name => new_name})
  erb(:stylist_detail)
end

delete('/stylist/:id') do
  id = params.fetch("id")
  @stylist = Stylist.find(id)
  @stylist.destroy()
  @stylists = Stylist.all()
  erb(:stylist_list)
end
