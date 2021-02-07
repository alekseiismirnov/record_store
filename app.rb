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
  @album = Album.find(params[:id].to_i)
  erb :album
end

post '/albums' do 
  name = params[:album_name]
  album = Album.new(name, nil)
  album.save
  
  @albums = Album.all
  erb :albums
end

get '/albums/:id/edit' do
  @album = Album.find(params[:id].to_i)

  erb :edit_album
end

patch '/albums/:id' do
  @album = Album.find(params[:id].to_i)
  @album.update(params[:name])
  @albums = Album.all

  erb :albums
end

delete '/album/:id' do
  "Delete the album"
end

get '/custom_route' do
  "Whatever, if we really need it"
end
