class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|

      t.string :notes
      t.datetime :published_at
      t.string :slug
      
      t.boolean :is_current

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
