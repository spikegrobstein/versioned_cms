class Page < ActiveRecord::Base
  
  belongs_to :project
  
  before_save :build_slug
  
  def to_param
    self.slug
  end
  
  def build_slug
    self.slug = self.title.parameterize
  end
  
end
