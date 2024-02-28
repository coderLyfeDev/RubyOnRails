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

ActiveRecord::Schema[7.1].define(version: 2024_02_27_072451) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachment", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blob", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_record", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "career", force: :cascade do |t|
    t.string "category"
    t.string "salary_range"
    t.string "sub_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "career_interest", force: :cascade do |t|
    t.bigint "career_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connected", force: :cascade do |t|
    t.datetime "requested_date", precision: nil
    t.bigint "requestor"
    t.bigint "user1"
    t.bigint "user2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "education", force: :cascade do |t|
    t.string "degree"
    t.boolean "graduated"
    t.boolean "highest_degree"
    t.string "school_name"
    t.string "state"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_info", force: :cascade do |t|
    t.string "file_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post", force: :cascade do |t|
    t.integer "likes"
    t.integer "shares"
    t.integer "comments"
    t.string "content"
    t.string "scope"
    t.string "post_type"
    t.string "tagged_users"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_info", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "profile_picture"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_role", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_history", force: :cascade do |t|
    t.boolean "current_position"
    t.string "employer_name"
    t.datetime "end_date", precision: nil
    t.string "location"
    t.string "position"
    t.datetime "start_date", precision: nil
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachment", "active_storage_blob", column: "blob_id"
  add_foreign_key "active_storage_variant_record", "active_storage_blob", column: "blob_id"
  add_foreign_key "career_interest", "career"
  add_foreign_key "career_interest", "user_info", column: "user_id"
  add_foreign_key "education", "user_info", column: "user_id"
  add_foreign_key "work_history", "user_info", column: "user_id"
end
