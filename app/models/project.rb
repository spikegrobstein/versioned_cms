class Project < ActiveRecord::Base
  
  default_scope order('name')
  
  has_many :nav_items, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  
  before_save :build_slug
  
  validates_uniqueness_of :name, :slug
  
  def to_param
    self.slug
  end
  
  def build_slug
    self.slug = self.name.parameterize
  end
  
end
