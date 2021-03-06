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

ActiveRecord::Schema.define(:version => 20131115193616) do

  create_table "maybes", :force => true do |t|
    t.integer  "user_id",                      :null => false
    t.integer  "profile_id",                   :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "prefer",     :default => true
  end

  add_index "maybes", ["prefer"], :name => "index_maybes_on_prefer"
  add_index "maybes", ["user_id", "profile_id"], :name => "index_maybes_on_user_id_and_profile_id", :unique => true

  create_table "messages", :force => true do |t|
    t.integer  "sender_id",    :null => false
    t.integer  "recipient_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "body"
  end

  add_index "messages", ["recipient_id"], :name => "index_messages_on_recipient_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "profiles", :force => true do |t|
    t.string   "username",                                      :null => false
    t.string   "gender"
    t.text     "about_me"
    t.boolean  "friends_wanted",             :default => false
    t.boolean  "dating_wanted",              :default => false
    t.boolean  "hookups_wanted",             :default => false
    t.boolean  "men_wanted",                 :default => false
    t.boolean  "women_wanted",               :default => false
    t.integer  "height"
    t.string   "body_type"
    t.string   "religion"
    t.string   "education"
    t.string   "children"
    t.string   "pets"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.boolean  "nonbinary_wanted",           :default => false
    t.integer  "user_id",                                       :null => false
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.integer  "stars_count",                :default => 0
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id", :unique => true
  add_index "profiles", ["username"], :name => "index_profiles_on_username", :unique => true

  create_table "saved_searches", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.string   "username"
    t.string   "gender"
    t.boolean  "friends_wanted"
    t.boolean  "dating_wanted"
    t.boolean  "hookups_wanted"
    t.boolean  "men_wanted"
    t.boolean  "women_wanted"
    t.boolean  "nonbinary_wanted"
    t.integer  "height"
    t.string   "body_type"
    t.string   "religion"
    t.string   "education"
    t.string   "children"
    t.string   "pets"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "saved_searches", ["user_id"], :name => "index_saved_searches_on_user_id", :unique => true

  create_table "stars", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "profile_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stars", ["user_id", "profile_id"], :name => "index_stars_on_user_id_and_profile_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "session_token",   :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

end
