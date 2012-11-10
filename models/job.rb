class Job
  include DataMapper::Resource
    
  property :id, Serial
  property :title, String
  property :description, Text
  property :closing_date, Date
  property :url, String
  property :sponsored, Boolean
  property :type, Enum[:permanent, :temporary], :default => :permanent

  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :area
  belongs_to :company
  belongs_to :job_type
  
  alias_method :to_s, :title
  
  def short_description
    description.split[0..50].join(' ') + '...'
  end
  
  def html_description
    description.gsub("\n", '<br />')
  end
end
