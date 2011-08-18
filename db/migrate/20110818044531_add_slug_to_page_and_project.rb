class AddSlugToPageAndProject < ActiveRecord::Migration
  def self.up
    
    add_column :pages, :slug, :string
    add_column :projects, :slug, :string
    
    Page.all.each do |page|
      page.build_slug
      page.save!
    end
    
    Project.all.each do |project|
      project.build_slug
      project.save!
    end
    
  end

  def self.down
    
    remove_column :pages, :slug
    remove_column :projects, :slug
    
  end
end
