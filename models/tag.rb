class Tag
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  
  timestamps :at
  
  has n, :jobs, :through => Resource
  
  alias_method :to_s, :name
end