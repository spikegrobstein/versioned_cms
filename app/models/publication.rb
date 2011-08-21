class Publication < ActiveRecord::Base
  
  scope :current, where(:is_current => true).limit(1)
  
  has_many :published_content_versions
  has_many :content_versions, :through => :published_content_versions
  
  before_save :build_slug
  
  def to_param
    self.slug
  end
  
  def build_slug
    self.slug = self.published_at.to_s.parameterize
  end

  
end
