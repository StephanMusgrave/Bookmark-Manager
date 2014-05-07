require 'sinatra'
require 'link'
require "data_mapper"

env = ENV["RACK_ENV"] || "development"


DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!

# dbtype://user:password@hostname:port/databasename

get '/' do
  erb :index
end