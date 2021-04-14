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

ActiveRecord::Schema.define(version: 2021_04_14_102807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "private_invite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending"
    t.index ["private_invite_id"], name: "index_acceptances_on_private_invite_id"
    t.index ["user_id"], name: "index_acceptances_on_user_id"
  end

  create_table "account_complaints", force: :cascade do |t|
    t.bigint "user_id"
    t.text "custom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "career_changes", default: false
    t.boolean "not_recieving_briefs", default: false
    t.boolean "dont_like_it", default: false
    t.boolean "unsatisfied", default: false
    t.boolean "not_useful", default: false
    t.index ["user_id"], name: "index_account_complaints_on_user_id"
  end

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "user_brief_id"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending"
    t.index ["user_brief_id"], name: "index_applications_on_user_brief_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "description"
    t.string "image"
    t.string "title"
    t.string "author"
    t.text "paragraph_1"
    t.text "paragraph_2"
    t.text "paragraph_3"
    t.text "paragraph_4"
    t.text "paragraph_5"
    t.text "paragraph_6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "auditions", force: :cascade do |t|
    t.string "video"
    t.string "title"
    t.bigint "user_id"
    t.bigint "brief_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brief_id"], name: "index_auditions_on_brief_id"
    t.index ["user_id"], name: "index_auditions_on_user_id"
  end

  create_table "briefs", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "age_range"
    t.string "ethnicity"
    t.text "flaws"
    t.text "traits"
    t.string "wants"
    t.string "needs"
    t.string "arc_summary"
    t.string "profession"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scene"
    t.index ["user_id"], name: "index_briefs_on_user_id"
  end

  create_table "pb_reasons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "private_brief_id"
    t.text "custom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "human_trafficking", default: false
    t.boolean "unsafe", default: false
    t.boolean "sexual_content", default: false
    t.boolean "child_abuse", default: false
    t.boolean "not_legit", default: false
    t.index ["private_brief_id"], name: "index_pb_reasons_on_private_brief_id"
    t.index ["user_id"], name: "index_pb_reasons_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "caption"
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "private_auditions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "private_brief_id"
    t.string "video"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["private_brief_id"], name: "index_private_auditions_on_private_brief_id"
    t.index ["user_id"], name: "index_private_auditions_on_user_id"
  end

  create_table "private_briefs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "ethnicity"
    t.string "language"
    t.string "marital_status"
    t.bigint "user_id"
    t.integer "sender_id"
    t.string "title"
    t.string "scene"
    t.string "profession"
    t.string "hometown"
    t.string "current_home"
    t.text "wants"
    t.text "needs"
    t.text "traits"
    t.text "flaws"
    t.text "arc_summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending"
    t.index ["user_id"], name: "index_private_briefs_on_user_id"
  end

  create_table "private_invites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "private_brief_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending"
    t.index ["private_brief_id"], name: "index_private_invites_on_private_brief_id"
    t.index ["user_id"], name: "index_private_invites_on_user_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "brief_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "human_trafficking", default: false
    t.boolean "unsafe", default: false
    t.boolean "sexual_content", default: false
    t.boolean "child_abuse", default: false
    t.boolean "not_legit", default: false
    t.text "custom"
    t.index ["brief_id"], name: "index_reasons_on_brief_id"
    t.index ["user_id"], name: "index_reasons_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_auditions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "audition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending"
    t.index ["audition_id"], name: "index_user_auditions_on_audition_id"
    t.index ["user_id"], name: "index_user_auditions_on_user_id"
  end

  create_table "user_briefs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "brief_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "Pending"
    t.index ["brief_id"], name: "index_user_briefs_on_brief_id"
    t.index ["user_id"], name: "index_user_briefs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "acceptances", "private_invites"
  add_foreign_key "acceptances", "users"
  add_foreign_key "account_complaints", "users"
  add_foreign_key "applications", "user_briefs"
  add_foreign_key "applications", "users"
  add_foreign_key "articles", "users"
  add_foreign_key "auditions", "briefs"
  add_foreign_key "auditions", "users"
  add_foreign_key "briefs", "users"
  add_foreign_key "pb_reasons", "private_briefs"
  add_foreign_key "pb_reasons", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "private_auditions", "private_briefs"
  add_foreign_key "private_auditions", "users"
  add_foreign_key "private_briefs", "users"
  add_foreign_key "private_invites", "private_briefs"
  add_foreign_key "private_invites", "users"
  add_foreign_key "reasons", "briefs"
  add_foreign_key "reasons", "users"
  add_foreign_key "user_auditions", "auditions"
  add_foreign_key "user_auditions", "users"
  add_foreign_key "user_briefs", "briefs"
  add_foreign_key "user_briefs", "users"
end
