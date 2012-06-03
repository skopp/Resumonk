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

ActiveRecord::Schema.define(:version => 20120603142235) do

  create_table "educations", :force => true do |t|
    t.integer  "resume_id"
    t.string   "institute_name"
    t.string   "degree"
    t.string   "start_date"
    t.string   "end_date"
    t.float    "gpa"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "description"
  end

  create_table "experiences", :force => true do |t|
    t.string   "company_name"
    t.string   "designation"
    t.text     "job_description"
    t.string   "start_date"
    t.string   "end_date"
    t.boolean  "current"
    t.integer  "resume_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "position"
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "user_id"
    t.string   "transaction_id"
    t.string   "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "project_title"
    t.integer  "resume_id"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "publications", :force => true do |t|
    t.string   "title"
    t.string   "publisher"
    t.string   "date"
    t.string   "author"
    t.text     "description"
    t.integer  "resume_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "resumes", :force => true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.text     "address"
    t.string   "phone"
    t.string   "website"
    t.text     "objective"
    t.datetime "created_at",                                                                                    :null => false
    t.datetime "updated_at",                                                                                    :null => false
    t.string   "layout"
    t.string   "title"
    t.string   "short_link"
    t.string   "designation"
    t.string   "email"
    t.string   "layout_order", :default => "educations experiences skills projects publications volunteerings"
    t.string   "color"
    t.string   "font"
  end

  add_index "resumes", ["short_link"], :name => "index_resumes_on_short_link"

  create_table "skills", :force => true do |t|
    t.integer  "resume_id"
    t.string   "skill"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "username"
    t.boolean  "pro",             :default => false
  end

  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "visits", :force => true do |t|
    t.string   "ip"
    t.string   "country"
    t.integer  "resume_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "volunteerings", :force => true do |t|
    t.string   "cause"
    t.string   "organization"
    t.integer  "resume_id"
    t.string   "start_date"
    t.string   "end_date"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
