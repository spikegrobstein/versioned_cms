class CreatePublishedContentVersions < ActiveRecord::Migration
  def self.up
    create_table :published_content_versions do |t|

      t.integer :content_version_id
      t.integer :publication_id

      t.timestamps
    end
    
    add_index :published_content_versions, :content_version_id
    add_index :published_content_versions, :publication_id
  end

  def self.down
    drop_table :published_content_versions
  end
end
