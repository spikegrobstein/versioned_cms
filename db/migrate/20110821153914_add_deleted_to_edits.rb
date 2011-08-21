class AddDeletedToEdits < ActiveRecord::Migration
  def self.up
    add_column :content_versions, :deleted, :boolean, :default => false
  end

  def self.down
    remove_column :content_versions, :deleted
  end
end
