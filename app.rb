require './lib/album.rb'

require 'pry'
require 'sinatra'
require 'sinatra/reloader'

also_reload 'lib/**/*.rb'


get '/' do
  @albums = Album.all
  erb :albums
end

get '/albums' do
  @albums = Album.all
  erb :albums
end

get '/albums/new' do
  erb :new_album
end

get '/albums/:id' do
  "Page with album info, specified with the id. The value of the id is #{params[:id]}"
end

post '/albums' do 
  binding.pry
end

get '/albums/:id/edit' do
  "Renders form for the album editing. The value of the id is #{params[:id]}"
end

patch '/album/:id' do
  "Updates existing album info. Again, not accessible by URL typing"
end

delete '/album/:id' do
  "Delete the album"
end

get '/custom_route' do
  "Whatever, if we really need it"
end
