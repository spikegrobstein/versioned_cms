class AddContentMarkupToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :content_markup, :string, :default => 'markdown'
  end

  def self.down
    remove_column :pages, :content_markup, :string
  end
end
