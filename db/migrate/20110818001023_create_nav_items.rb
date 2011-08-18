class CreateNavItems < ActiveRecord::Migration
  def self.up
    create_table :nav_items do |t|

      t.integer :position # for ordering
      t.string  :label # the way it's rendered
      t.string  :url # what it points to
      
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :nav_items
  end
end
