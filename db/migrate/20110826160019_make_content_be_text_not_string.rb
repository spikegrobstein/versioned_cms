class MakeContentBeTextNotString < ActiveRecord::Migration
  def self.up
    
    change_column :content_versions, :content, :text
    
  end

  def self.down
    
    change_column :content_versions, :content, :string
    
  end
end
