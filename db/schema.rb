# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_06_002423) do
  create_table "accesses", force: :cascade do |t|
    t.integer "link_id"
    t.string "ip"
    t.datetime "date_and_time"
    t.index ["link_id"], name: "index_accesses_on_link_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uses", default: 0
    t.string "type"
    t.integer "user_id"
    t.string "password_digest"
    t.datetime "expiration_date"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
