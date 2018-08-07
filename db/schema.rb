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

ActiveRecord::Schema.define(version: 20180806062726) do

  create_table "applications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_applications_on_project_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_likes_on_project_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_memberships_on_project_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "project_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_likes_on_project_id"
    t.index ["user_id"], name: "index_project_likes_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.string "title", null: false
    t.integer "maxMember"
    t.string "skills"
    t.string "description", null: false
    t.boolean "isKorean"
    t.boolean "isOnline"
    t.string "tools"
    t.string "tag_string"
    t.integer "tag_id"
    t.boolean "isClosed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference_file_name"
    t.string "reference_content_type"
    t.bigint "reference_file_size"
    t.datetime "reference_updated_at"
    t.index ["tag_id"], name: "index_projects_on_tag_id"
  end

  create_table "projects_tags", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "tag_id", null: false
    t.index ["project_id", "tag_id"], name: "index_projects_tags_on_project_id_and_tag_id"
    t.index ["tag_id", "project_id"], name: "index_projects_tags_on_tag_id_and_project_id"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "project_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tags_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "institution"
    t.string "research_interests"
    t.text "introduction"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
