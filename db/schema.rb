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

ActiveRecord::Schema.define(:version => 20110808160608) do

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["friend_id"], :name => "index_comments_on_friend_id"
  add_index "comments", ["resource_id"], :name => "index_comments_on_resource_id"
  add_index "comments", ["resource_type"], :name => "index_comments_on_resource_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "friends", :force => true do |t|
    t.string   "email"
    t.string   "status"
    t.string   "shared_key"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profile_attributes", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "attribute_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles_attributes", :id => false, :force => true do |t|
    t.integer "profile_id"
    t.integer "profile_attribute_id"
  end

  create_table "profiles_friends", :id => false, :force => true do |t|
    t.integer "profile_id"
    t.integer "friend_id"
  end

  create_table "statuses", :force => true do |t|
    t.text     "value"
    t.integer  "user_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
