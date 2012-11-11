class Area
  include DataMapper::Resource

  attr_accessor :number

  property :id, Serial
  property :name, String
  property :lat, Float
  property :lng, Float

  has n, :jobs
  
  alias_method :to_s, :name
end
