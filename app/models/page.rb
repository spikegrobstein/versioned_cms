class Page < ActiveRecord::Base
  
  default_scope order('title')
  
  has_many :content_versions, :order => 'created_at DESC', :dependent => :destroy
  belongs_to :current_version, :class_name => 'ContentVersion'
  belongs_to :project
  
  before_save :build_slug
  
  validates_uniqueness_of :title, :slug, :scope => :project_id
  
  # versioned convenience functions
  def content=(new_content)
    return if (not current_version.nil?) and (current_version.content == new_content)
    
    update_version(:content, new_content)
  end
  
  def content_markup=(new_content_markup)
    return if (not current_version.nil?) and (current_version.content_markup == new_content_markup)
    
    update_version(:content_markup, new_content_markup)
  end
  
  def content
    return '' if current_version.nil?
    current_version.content
  end
  
  def content_markup
    return '' if current_version.nil?
    current_version.content_markup
  end
  
  # forces a new version
  def update_version(field, new_value)
    if not current_version.nil? and current_version.new_record?
      self.current_version[field] = new_value
    else
      self.current_version = content_versions.build( self.current_version.attributes.merge({field, new_value}) )
    end
  end
  
  # slug stuff
  
  def to_param
    self.slug
  end
  
  def build_slug
    self.slug = self.title.parameterize
  end
  
  
    
end
