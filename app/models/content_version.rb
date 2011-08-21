class ContentVersion < ActiveRecord::Base
  
  scope :deleted, where('deleted')
  scope :active, where('not deleted')
  
  has_many :published_content_versions
  has_many :publications, :through => :published_content_versions
  
  belongs_to :page
  
  
  def currently_published?
    not publications.find_by_is_current(true).nil?
  end
  
end
