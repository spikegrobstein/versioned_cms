class Page < ActiveRecord::Base
  
  has_many :content_versions
  belongs_to :current_version, :class_name => 'ContentVersion'
  belongs_to :project
  
  before_save :build_slug
  
  def to_param
    self.slug
  end
  
  def content=(new_content)
    return if (not current_version.nil?) and (current_version.content == new_content)
    
    update_version(:content, new_content)
  end
  
  def content_markup=(new_content_markup)
    return if (not current_version.nil?) and (current_version.content_markup == new_content_markup)
    
    update_version(:content_markup, new_content_markup)
  end
  
  def content
    current_version.content
  end
  
  def content_markup
    current_version.content_markup
  end
  
  # forces a new version
  def update_version(field, new_value)
    self.current_version = ContentVersion.new(field => new_value)
  end
  
  def build_slug
    self.slug = self.title.parameterize
  end
  
  
    
end
