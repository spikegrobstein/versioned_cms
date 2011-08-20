class AddOpenInNewWindowToNavItems < ActiveRecord::Migration
  def self.up
    add_column :nav_items, :open_in_new_window, :boolean, :default => false
  end

  def self.down
    remove_column :nav_items, :open_in_new_window
  end
end
