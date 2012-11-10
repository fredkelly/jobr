class Vacancy
    include DataMapper::Resource

    property :id, Serial
    property :date, Date
    property :number, Integer

    has 1, :job
    has 1, :area
end
