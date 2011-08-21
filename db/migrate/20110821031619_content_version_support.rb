class ContentVersionSupport < ActiveRecord::Migration
  def self.up
    remove_column :pages, :current_version_id
    
    add_column :pages, :current_version_id, :integer
    
    Page.all.each do |page|
      page.content = page.content
      page.content_markup = page.content_markup
      page.save!
    end
    
    remove_column :pages, :content_markup
    remove_column :pages, :content
    
  end

  def self.down
    
    # add_column :pages, :content_markup, :string
    # add_column :pages, :content, :string
    # 
    # Page.all.each do |page|
    #   page.content = page.current_version.content
    #   page.content_markup = page.current_version.content_markup
    #   page.save!
    # end
    # 
    # remove_column :pages, :current_version_id, :integer
    
  end
end
