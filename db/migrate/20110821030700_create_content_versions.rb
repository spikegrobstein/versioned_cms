class CreateContentVersions < ActiveRecord::Migration
  def self.up
    create_table :content_versions do |t|
      
      t.string :content
      t.string :content_markup
      
      t.timestamps
    end
  end

  def self.down
    drop_table :content_versions
  end
end
