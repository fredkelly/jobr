require 'rubygems'
require 'bundler/setup'

require 'net/http'
require 'json'

Bundler.require

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://jobr@localhost:5432/jobr")

require './models/company.rb'
require './models/job.rb'
require './models/job_type.rb'
require './models/area.rb'
require './models/vacancy.rb'

DataMapper.finalize
DataMapper.auto_upgrade!

HOST = 'maps.googleapis.com'

    class GeocodeError < StandardError
    end

    def self.format(string)
        return string.gsub(' ', '+')
    end

def geocode(location)
  response = Net::HTTP.get(HOST, "/maps/api/geocode/json?address=#{format(location)}&sensor=false")
  results = JSON.parse(response)['results']
  raise GeocodeError, "No results found for location #{location}" if results.empty?

  return results[0]['geometry']['location']
end

failures = []

Area.all.each do |area|
  begin
    geocode = geocode(area.name)

    area.lat = geocode['lat']
    area.lng = geocode['lng']
    area.save

    puts "SUCCESS: #{area.name}"
  rescue GeocodeError
    failures << area.name
  end

  sleep 1
 end

puts "FAILURES:"
puts failures
