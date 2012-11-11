class Area
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :lat, Float
  property :lng, Float

  has n, :jobs
  
  alias_method :to_s, :name
end
