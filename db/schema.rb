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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151216133054) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "avatar"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "districts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true

  create_table "fractions", force: true do |t|
    t.string   "name"
    t.integer  "waste_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "locations", force: true do |t|
    t.string   "street"
    t.string   "number"
    t.string   "full_address"
    t.float    "lat"
    t.float    "lng"
    t.integer  "number_int"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.text     "info"
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phrases", force: true do |t|
    t.string   "name"
    t.integer  "fraction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_versions", force: true do |t|
    t.integer  "route_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "route_versions", ["route_id"], name: "index_route_versions_on_route_id"

  create_table "routes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["name"], name: "index_settings_on_name"

  create_table "static_pages", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wastes", force: true do |t|
    t.integer  "kind"
    t.string   "street"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.date     "date"
    t.string   "area"
    t.string   "type"
    t.integer  "district_id"
    t.text     "details"
    t.boolean  "visible",                       default: true
    t.integer  "route_id"
    t.integer  "position"
    t.text     "description"
    t.string   "picture"
    t.string   "container_type"
    t.integer  "clear_glass_containers",        default: 0
    t.integer  "colorful_glass_containers",     default: 0
    t.integer  "plastic_containers",            default: 0
    t.integer  "maculature_containers",         default: 0
    t.string   "clear_glass_container_type"
    t.string   "colorful_glass_container_type"
    t.string   "plastic_container_type"
    t.string   "maculature_container_type"
  end

  add_index "wastes", ["district_id"], name: "index_wastes_on_district_id"
  add_index "wastes", ["position"], name: "index_wastes_on_position"
  add_index "wastes", ["route_id"], name: "index_wastes_on_route_id"

end
