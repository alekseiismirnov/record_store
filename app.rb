require './lib/album.rb'

require 'pry'
require 'sinatra'
require 'sinatra/reloader'

also_reload 'lib/**/*.rb'


get '/' do
  @albums = Album.sort
  @albums_sold = Album.all_sold
  erb :albums
end

get '/albums' do
  @albums = Album.sort
  @albums_sold = Album.all_sold
  erb :albums
end

get '/albums/new' do
  erb :new_album
end

get '/albums/:id' do
  @album = Album.find(params[:id].to_i)
  erb :album
end

post '/albums/:id/sell' do
  @album = Album.find(params[:id].to_i)
  @album.sold

  @albums = Album.all
  @albums_sold = Album.all_sold
  erb :albums
end

post '/albums' do 
  name = params[:album_name]
  album = Album.new(name, nil)
  album.save

  @albums_sold = Album.all_sold
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

delete '/albums/:id' do
  @album = Album.find(params[:id].to_i)
  @album.delete

  @albums = Album.all
  erb :albums
end

post '/search' do
  @album = Album.search params[:album_name]
  if @album 
    erb :album 
  else
    erb :nothing_found
  end
end
