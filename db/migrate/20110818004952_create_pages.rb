class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|

      t.string :title
      t.text :content
      
      t.integer :project_id
      

      t.timestamps
    end
    
    add_index :pages, :project_id
  end

  def self.down
    drop_table :pages
  end
end
