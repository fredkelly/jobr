class Vacancy
  include DataMapper::Resource

  property :id, Serial
  property :date, Date, :index => true
  property :number, Integer

  property :job_type_id, Integer, :index => true
  property :area_id, Integer, :index => true

  def self.areas_by_job_type(job_type_id)
    repository.adapter.select("SELECT vacancies.number, areas.lat, areas.lng FROM vacancies LEFT JOIN areas ON vacancies.area_id = areas.id WHERE date = to_date('September 2012', 'Month YYYY') AND job_type_id = #{job_type_id}")
  end
end
