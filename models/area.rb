class Area
    include DataMapper::Resource

    property :id, Serial
    property :name, String

    has n, :jobs
end
