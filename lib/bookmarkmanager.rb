require 'sinatra/base'

class bookmarkmanager < Sinatra::Base
  get '/' do
    'Hello bookmark-manager!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

require 'sinatra'
require_relative 'models'

require "data_mapper"

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
# puts "postgres://localhost/bookmark_manager_#{env}""

require './lib/link' #this must be done after datamapper is initialized
require './lib/tag'

DataMapper.finalize

DataMapper.auto_upgrade!

# dbtype://user:password@hostname:port/databasename

get '/' do
  @links = Link.all
  erb :index
end

post '/links' do
  url = params["url"]
  title = params["title"]
  tags = params["tags"].split(" ").map{|tag| Tag.first_or_create(:text => tag)}
  Link.create(:url => url, :title => title, :tags => tags)
  redirect to ('/')
end

get '/tags/:text' do
  tag = Tag.first(:text => params[:text])
  @links = tag ? tag.links : []
  erb :index
end

get '/users/new' do
  #use quotes to avoid ruby trying to divide the symbol :users by new
  erb :"users/new"
end 

post '/users' do
  User.create(:email => params[:email],
              :password => params[:password])
  redirect to('/')
end


