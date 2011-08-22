class AddNotesToContentVersions < ActiveRecord::Migration
  def self.up
    add_column :content_versions, :notes, :string
  end

  def self.down
    remove_column :content_versions, :notes
  end
end
