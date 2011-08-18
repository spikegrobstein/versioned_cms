class Project < ActiveRecord::Base
  
  has_many :nav_items
  has_many :pages
  
  before_save :build_slug
  
  def to_param
    self.slug
  end
  
  def build_slug
    self.slug = self.name.parameterize
  end
  
end
