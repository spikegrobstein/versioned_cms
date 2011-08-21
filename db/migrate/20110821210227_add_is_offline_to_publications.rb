class AddIsOfflineToPublications < ActiveRecord::Migration
  def self.up
    add_column :publications, :is_offline, :boolean, :default => false
  end

  def self.down
    remove_column :publications, :is_offline
  end
end
