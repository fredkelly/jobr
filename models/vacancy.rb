class Vacancy
    include DataMapper::Resource

    property :id, Serial
    property :date, Date
    property :number, Integer

    property :job_type_id, Integer
    property :area_id, Integer
end
