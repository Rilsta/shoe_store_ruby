require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

get('/stores/new') do
  erb(:store_form)
end

post('/stores') do
  store_name = params.fetch('store_name')
  Store.create({store_name: store_name})
  redirect ('/stores')
end
