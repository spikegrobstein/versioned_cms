class PublishedContentVersions < ActiveRecord::Base
  
  belongs_to :publication
  belongs_to :content_version
  
end
