class ContentVersion < ActiveRecord::Base
  
  scope :deleted, where('deleted')
  scope :active, where('not deleted')
  
  belongs_to :page
  
  
end
