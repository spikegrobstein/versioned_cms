class AddOpenInNewWindowToNavItems < ActiveRecord::Migration
  def self.up
    add_column :nav_items, :open_in_new_window, :boolean
  end

  def self.down
    remove_column :nav_items, :open_in_new_window, :boolean
  end
end
