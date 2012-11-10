class JobType
    include DataMapper::Resource

    property :id, Serial
    property :name, String, :length => 256

    has n, :jobs
end
