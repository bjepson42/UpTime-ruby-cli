require 'bundler/setup'
Bundler.require

require 'rake'
require 'active_record'
require 'sinatra/activerecord'
require 'yaml/store'
require 'ostruct'
require 'date'
require_all 'app'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/uptime.db"
)
