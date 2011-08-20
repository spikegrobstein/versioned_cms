class AddSecondaryToNavItems < ActiveRecord::Migration
  def self.up
    add_column :nav_items, :is_secondary, :boolean
  end

  def self.down
    remove_column :nav_items, :is_secondary
  end
end
