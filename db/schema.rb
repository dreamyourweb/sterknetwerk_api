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

ActiveRecord::Schema.define(:version => 20120821131610) do

  create_table "answers", :force => true do |t|
    t.integer  "result_id"
    t.integer  "question_id"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "aspects", :force => true do |t|
    t.string   "title"
    t.integer  "score"
    t.string   "answer_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "indicators", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "example"
    t.string   "score"
    t.integer  "aspect_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.string   "answers"
    t.integer  "answer_scores"
    t.string   "answer_type"
    t.integer  "score"
    t.integer  "indicator_id"
    t.integer  "aspect_id"
    t.integer  "factor"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "results", :force => true do |t|
    t.string   "email"
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "tel"
    t.string   "cc"
    t.string   "bcc"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "authentication_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
