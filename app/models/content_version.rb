class ContentVersion < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  
  scope :deleted, where('deleted')
  scope :active, where('not deleted')
  
  has_many :published_content_versions
  has_many :publications, :through => :published_content_versions
  
  belongs_to :page
  
  
  def to_s
    if notes.blank?
      time_ago_in_words(created_at)
    else
      notes
    end
  end
  
  def currently_published?
    not publications.find_by_is_current(true).nil?
  end
  
end
