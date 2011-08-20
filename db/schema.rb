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

ActiveRecord::Schema.define(:version => 20110820034816) do

  create_table "nav_items", :force => true do |t|
    t.integer  "position"
    t.string   "label"
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_secondary"
  end

  add_index "nav_items", ["project_id"], :name => "index_nav_items_on_project_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "content_markup", :default => "markdown"
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
  end

end
