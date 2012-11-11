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
  
  has n, :tags, :through => Resource
  
  # ensure tags are loaded
  after :save, :tags
  
  alias_method :to_s, :title
  
  def self.search(title, area)
    with_title = Job.all(:conditions => ['LOWER(title) LIKE ?', "%#{title.downcase}%"]) rescue []
    in_area = Area.all(:conditions => ['LOWER(name) LIKE ?', "%#{area.downcase}%"]).jobs rescue []
    return with_title if !area or area.empty?
    return in_area if !title or title.empty?
    with_title & in_area # otherwise match both criteria
  end
  
  def short_description
    description.split[0..50].join(' ') + '...'
  end
  
  def html_description
    description.gsub("\n", '<br />')
  end
  
  def tags
    if super.empty?
      zemanta = ::TermExtraction::Zemanta.new(:api_key => 'vvflwgaafjrfvfjrqafb2uts', :context => description)
      set_tags zemanta.terms.map(&:strip)
    end
    super
  end
  
  def set_tags(tags)
    update(:tags => tags.map{|tag| Tag.first_or_create(:name => tag.downcase)})
  end
end
