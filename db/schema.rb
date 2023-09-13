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

ActiveRecord::Schema.define(version: 2023_09_13_003312) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "alerts", force: :cascade do |t|
    t.integer "review_id", null: false
    t.text "reason", null: false
    t.boolean "is_done", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["review_id"], name: "index_alerts_on_review_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "review_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "subject", null: false
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "admission_month", null: false
    t.integer "duration", null: false
    t.text "condition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_favorites_on_school_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "nice_reviews", force: :cascade do |t|
    t.integer "review_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_nice_reviews_on_review_id"
    t.index ["user_id"], name: "index_nice_reviews_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visiter_id", null: false
    t.integer "visited_id", null: false
    t.integer "review_id"
    t.string "action"
    t.boolean "is_checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float "star_integer", null: false
    t.text "comment_integer"
    t.integer "evaluation_class", default: 3, null: false
    t.text "comment_class"
    t.integer "evaluation_after_graduation", default: 3, null: false
    t.text "comment_after_graduation"
    t.integer "evaluation_place", default: 3, null: false
    t.text "comment_place"
    t.integer "evaluation_facility", default: 3, null: false
    t.text "comment_facility"
    t.integer "evaluation_student", default: 3, null: false
    t.text "comment_student"
    t.integer "evaluation_teacher", default: 3, null: false
    t.text "comment_teacher"
    t.integer "evaluation_life", default: 3, null: false
    t.text "comment_life"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_open", default: true, null: false
    t.integer "school_id"
    t.integer "user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "name_en", null: false
    t.text "summary"
    t.string "station", null: false
    t.text "address", null: false
    t.text "hp"
    t.text "facebook"
    t.text "twitter"
    t.text "instagram"
    t.text "tiktok"
    t.text "youtube"
    t.text "condition"
    t.integer "anual_fee"
    t.boolean "have_dormitory", default: false
    t.integer "dormitory_fee"
    t.boolean "is_open", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "prefecture", default: 13, null: false
    t.text "image_from"
    t.float "latitude"
    t.float "longitude"
    t.string "building"
    t.integer "capacity"
  end

  create_table "student_nationality_taggings", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "student_nationality_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_student_nationality_taggings_on_school_id"
    t.index ["student_nationality_tag_id"], name: "index_student_nationality_taggings_on_student_nationality_tag_id"
  end

  create_table "student_nationality_tags", force: :cascade do |t|
    t.string "nationality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "job"
    t.string "country_code", default: "JP"
    t.boolean "is_deleted", default: false, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "went_schools", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "graduate_year"
    t.integer "graduate_month"
    t.index ["school_id"], name: "index_went_schools_on_school_id"
    t.index ["user_id"], name: "index_went_schools_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "alerts", "reviews"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "schools"
  add_foreign_key "favorites", "schools"
  add_foreign_key "favorites", "users"
  add_foreign_key "nice_reviews", "reviews"
  add_foreign_key "nice_reviews", "users"
  add_foreign_key "student_nationality_taggings", "schools"
  add_foreign_key "student_nationality_taggings", "student_nationality_tags"
  add_foreign_key "went_schools", "schools"
  add_foreign_key "went_schools", "users"
end
