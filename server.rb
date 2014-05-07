require 'sinatra'

require "data_mapper"

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
require './lib/link' #this must be done after datamapper is initialized

DataMapper.finalize

DataMapper.auto_upgrade!

# dbtype://user:password@hostname:port/databasename

get '/' do
  @links = Link.all
  erb :index
end