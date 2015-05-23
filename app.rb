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

post('/add_client/:id') do
  @name = params.fetch("name")
  @stylist_id = params.fetch("id")
  @stylist = Stylist.find(@stylist_id)
  add_client = Client.new({:name => @name})
  @stylist.clients.push(add_client)
  erb(:stylist_detail)
end

get('/clients') do
  @clients = Client.all()
  erb(:client_list)
end

post('/add_client') do
  name = params.fetch("name")
  Client.create({:name => name})
  @clients = Client.all()
  erb(:client_list)
end

get('/clients/:id') do
  @client = Client.find(params.fetch("id"))
  erb(:client_detail)
end

patch('/client/:id') do
  new_name = params.fetch('new_name')
  @client = Client.find(params.fetch('id').to_i())
  @client.update({:name => new_name})
  erb(:client_detail)
end

delete('/client/:id') do
  id = params.fetch("id")
  @client = Client.find(id)
  @client.destroy()
  @clients = Client.all()
  erb(:client_list)
end
