class ContentVersion < ActiveRecord::Base
  
  scope :deleted, where('deleted')
  scope :active, where('not deleted')
  
  has_many :published_content_versions
  
  belongs_to :page
  
  
end
