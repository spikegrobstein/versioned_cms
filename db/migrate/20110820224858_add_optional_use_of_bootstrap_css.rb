class AddOptionalUseOfBootstrapCss < ActiveRecord::Migration
  def self.up
    add_column :projects, :use_bootstrap_css, :boolean, :default => true
  end

  def self.down
    remove_column :projects, :use_bootstrap_css
  end
end
