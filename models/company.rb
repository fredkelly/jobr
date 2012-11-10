class Company
  include DataMapper::Resource
    
  property :id, Serial
  property :name, String

  has n, :jobs
  
  alias_method :to_s, :name
end
