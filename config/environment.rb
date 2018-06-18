require 'bundler/setup'
Bundler.require

require 'rake'
require 'active_record'
require 'sinatra/activerecord'
require 'yaml/store'
require 'ostruct'
require 'date'



ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/uptime.db"
)
