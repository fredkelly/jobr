class JobType
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :length => 256

  has n, :jobs

  def self.score(area_name)
    #SELECT * FROM 
#    area = Area.all(:conditions => ['LOWER(name) LIKE ?', "%#{area_name.downcase}%"]).jobs rescue []
#    return area[0].id
    #SELECT * FROM vacancies WHERE area_id = 1 AND job_type_id = 1 ORDER BY date
#    sequence = Vacancy.all(:area_id => area[0].id, :job_type_id => self.id, :order => [ :date.desc ]) 
    22
  end 

end
