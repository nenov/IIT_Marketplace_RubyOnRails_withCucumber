# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121114211818) do

  create_table "adverts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "reverse"
    t.float    "price"
    t.datetime "expiration_date"
    t.string   "user_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "advertphoto_file_name"
    t.string   "advertphoto_content_type"
    t.integer  "advertphoto_file_size"
    t.datetime "advertphoto_updated_at"
  end

  create_table "intervals", :force => true do |t|
    t.string   "day"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.integer  "start_hour"
    t.integer  "start_minute"
    t.integer  "end_hour"
    t.integer  "end_minute"
  end

  create_table "photos", :force => true do |t|
    t.string   "file_name"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "advertphoto_file_name"
    t.string   "advertphoto_content_type"
    t.integer  "advertphoto_file_size"
    t.datetime "advertphoto_updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
