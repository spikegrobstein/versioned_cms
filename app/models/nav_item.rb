class NavItem < ActiveRecord::Base
  
  belongs_to :project
  
  acts_as_list :scope => :project
  
  scope :primary, :conditions => 'is_secondary is null or is_secondary = 0'
  scope :secondary, :conditions => { :is_secondary => true }
  
end
