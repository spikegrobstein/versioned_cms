# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110822025338) do

  create_table "content_versions", :force => true do |t|
    t.integer  "page_id"
    t.string   "content"
    t.string   "content_markup"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",        :default => false
    t.string   "notes"
  end

  create_table "nav_items", :force => true do |t|
    t.integer  "position"
    t.string   "label"
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_secondary"
    t.boolean  "open_in_new_window", :default => false
  end

  add_index "nav_items", ["project_id"], :name => "index_nav_items_on_project_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "current_version_id"
  end

  add_index "pages", ["project_id"], :name => "index_pages_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "css"
    t.string   "footer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "use_bootstrap_css", :default => true
  end

  create_table "publications", :force => true do |t|
    t.string   "notes"
    t.datetime "published_at"
    t.string   "slug"
    t.boolean  "is_current"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_offline",   :default => false
  end

  create_table "published_content_versions", :force => true do |t|
    t.integer  "content_version_id"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "published_content_versions", ["content_version_id"], :name => "index_published_content_versions_on_content_version_id"
  add_index "published_content_versions", ["publication_id"], :name => "index_published_content_versions_on_publication_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
