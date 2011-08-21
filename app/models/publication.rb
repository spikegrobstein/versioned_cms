class Publication < ActiveRecord::Base
  
  scope :current, where(:is_current => true).limit(1)
  
  has_many :published_content_versions
  has_many :content_versions, :through => :published_content_versions
  
  before_save :build_slug
  
  def to_param
    self.slug
  end
  
  def build_slug
    if published_at.nil?
      self.published_at = Time.now
    end
    
    self.slug = self.published_at.utc.strftime("%Y%m%d%H%M%S")
  end

  
end
