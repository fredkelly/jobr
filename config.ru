require 'rubygems'
require 'bundler/setup'

Bundler.require

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/jobr.db")

Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

DataMapper.finalize
DataMapper.auto_upgrade!

require './jobr.rb'
run Jobr
