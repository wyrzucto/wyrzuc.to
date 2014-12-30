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

ActiveRecord::Schema.define(version: 20141230065122) do

  create_table "kolorowes", force: true do |t|
    t.string   "ulica"
    t.string   "numer"
    t.string   "opis"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "odbiors", force: true do |t|
    t.string   "ulica"
    t.date     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: true do |t|
    t.string   "ulicas"
    t.string   "ulica"
    t.string   "nr_domu"
    t.string   "dzielnica"
    t.string   "suche1"
    t.string   "suche2"
    t.string   "suche3"
    t.string   "suche4"
    t.string   "suche5"
    t.string   "suche6"
    t.string   "mokre1"
    t.string   "mokre2"
    t.string   "mokre3"
    t.string   "mokre4"
    t.string   "mokre5"
    t.string   "mokre6"
    t.string   "mieszane1"
    t.string   "mieszane2"
    t.string   "mieszane3"
    t.string   "mieszane4"
    t.string   "mieszane5"
    t.string   "mieszane6"
    t.string   "nie_odebrane"
    t.string   "typ"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "punkts", force: true do |t|
    t.string   "nazwa"
    t.integer  "telefon"
    t.string   "co"
    t.float    "c1"
    t.float    "c2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
