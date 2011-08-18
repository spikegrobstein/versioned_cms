class Project < ActiveRecord::Base
  
  has_many :nav_items
  has_many :pages
  
end
