class Job
    include DataMapper::Resource
    
    property :id, Serial
    property :title, String
    property :description, String
    property :closing_date, Date
    property :url, String
    property :sponsored, Boolean
    property :type, Enum[:permanent, :temporary], :default => :permanent

    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :area
    belongs_to :company
    belongs_to :job_type
end

