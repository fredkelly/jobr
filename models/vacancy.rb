class Vacancy
    include DataMapper::Resource

    property :id, Serial
    property :date, Date
    property :number, Integer

    belongs_to :job_type
    belongs_to :area
end
