env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/book_manager_#{env}")

require './lib/link'

DataMapper.finalize

DataMapper.auto_upgrade!

dbtype://user:password@hostname:port/databasename
