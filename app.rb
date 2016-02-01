require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

##Homepage->

get('/') do
  erb(:index)
end

##adding a shoe store->

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

get('/stores/new') do
  erb(:store_form)
end

post('/stores') do
  store_name = params.fetch('store_name')
  new_store = Store.new({store_name: store_name})
  if new_store.save()
    redirect ('/stores')
  else
    redirect ('/error')
  end
end

##edit shoe store information->

get('/stores/:id/edit') do
  @store = Store.find(params.fetch("id"))
  erb(:edit_store)
end

patch('/stores/:id') do
  @stores = Store.all
  store_name = params.fetch('store_name')
  @store = Store.find(params.fetch("id"))
  @store.update({store_name: store_name})
  erb(:stores)
end

##remove a store->

delete('/stores/:id/delete') do
  @store = Store.find(params.fetch("id"))
  @store.destroy
  redirect('/stores')
end

##adding shoe brands to a specific shoe store->

get('/stores/:id') do
  @store = Store.find(params.fetch("id"))
  @brands = Brand.all
  erb(:store)
end

get('/stores/:id/brands/new') do
  @store = Store.find(params.fetch("id"))
  erb(:brand_form)
end

post('/stores/:id/brands') do
  brand_name = params.fetch('brand_name')
  @brand = Brand.find_or_create_by({brand_name: brand_name})
  @store = Store.find(params.fetch("id"))
  @store.brands.push(@brand)
  erb(:store)
end
