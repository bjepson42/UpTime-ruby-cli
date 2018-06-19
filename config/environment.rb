require 'bundler/setup'
Bundler.require
require 'require_all'
require_all 'app'

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

#ActiveRecord::Base.logger = Logger.new("log.log")
#------This should elminate the logger showing sql
ActiveRecord::Base.logger.level = 1 # or Logger::INFO
