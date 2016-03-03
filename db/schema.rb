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

ActiveRecord::Schema.define(:version => 10) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer   "priority",                :default => 0
    t.integer   "attempts",                :default => 0
    t.text      "handler"
    t.text      "last_error"
    t.timestamp "run_at",     :limit => 6
    t.timestamp "locked_at",  :limit => 6
    t.timestamp "failed_at",  :limit => 6
    t.string    "locked_by"
    t.string    "queue"
    t.timestamp "created_at", :limit => 6,                :null => false
    t.timestamp "updated_at", :limit => 6,                :null => false
  end

  create_table "links", :force => true do |t|
    t.integer  "mailing_id"
    t.text     "name"
    t.text     "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "logs", :force => true do |t|
    t.integer  "mailing_id"
    t.integer  "member_id"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mailing_templates", :force => true do |t|
    t.text      "name"
    t.text      "body_html"
    t.text      "body_plain"
    t.text      "subject"
    t.text      "sqd"
    t.timestamp "created_at", :limit => 6, :null => false
    t.timestamp "updated_at", :limit => 6, :null => false
  end

  create_table "mailings", :force => true do |t|
    t.text      "name"
    t.text      "body_html"
    t.text      "body_plain"
    t.text      "subject"
    t.integer   "mailing_id"
    t.integer   "from_id"
    t.timestamp "created_at",          :limit => 6, :null => false
    t.timestamp "updated_at",          :limit => 6, :null => false
    t.text      "sqd"
    t.integer   "mailing_template_id"
    t.text      "from"
    t.integer   "campaign_id"
    t.integer   "list_id"
    t.text      "parsed_html"
  end

  create_table "member_mailings", :force => true do |t|
    t.integer   "member_id"
    t.integer   "mailing_id"
    t.timestamp "created_at",    :limit => 6
    t.timestamp "updated_at",    :limit => 6
    t.integer   "external_id"
    t.timestamp "first_opened",  :limit => 6
    t.timestamp "first_clicked", :limit => 6
  end

  add_index "member_mailings", ["external_id"], :name => "index_member_mailings_on_external_id"
  add_index "member_mailings", ["mailing_id"], :name => "index_member_mailings_on_mailing"
  add_index "member_mailings", ["member_id"], :name => "index_member_mailings_on_member_id"
  add_index "member_mailings", ["updated_at"], :name => "member_mailings_updated_at"

  create_table "opens", :force => true do |t|
    t.integer   "member_mailing_id"
    t.timestamp "created_at",        :limit => 6
    t.timestamp "updated_at",        :limit => 6
  end

  add_index "opens", ["member_mailing_id"], :name => "member_mailing_id"

  create_table "pcons", :force => true do |t|
    t.text      "name"
    t.text      "code"
    t.timestamp "created_at", :limit => 6, :null => false
    t.timestamp "updated_at", :limit => 6, :null => false
  end

end
