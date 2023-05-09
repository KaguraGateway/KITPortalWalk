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

ActiveRecord::Schema[7.0].define(version: 2023_05_09_122017) do
  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "admission_years", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year"], name: "index_admission_years_on_year", unique: true
  end

  create_table "buildings", id: :bigint, default: nil, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "place_type"
  end

  create_table "class_days", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date", null: false
    t.integer "day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_class_days_on_date", unique: true
    t.index ["day"], name: "index_class_days_on_day"
  end

  create_table "class_schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_time"], name: "index_class_schedules_on_end_time"
    t.index ["name"], name: "index_class_schedules_on_name"
    t.index ["start_time"], name: "index_class_schedules_on_start_time"
  end

  create_table "classrooms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "room_number", null: false
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_classrooms_on_building_id"
    t.index ["room_number", "building_id"], name: "index_classrooms_on_room_number_and_building_id", unique: true
    t.index ["room_number"], name: "index_classrooms_on_room_number"
  end

  create_table "course_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admission_year_id", null: false
    t.index ["admission_year_id"], name: "index_course_categories_on_admission_year_id"
    t.index ["title"], name: "index_course_categories_on_title", unique: true
  end

  create_table "events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_events_on_date"
    t.index ["title"], name: "index_events_on_title"
  end

  create_table "half_semesters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "semester_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "season_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_date"], name: "index_half_semesters_on_end_date"
    t.index ["season_type"], name: "index_half_semesters_on_season_type"
    t.index ["semester_id"], name: "index_half_semesters_on_semester_id"
    t.index ["start_date"], name: "index_half_semesters_on_start_date"
  end

  create_table "semesters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "gakki", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_date"], name: "index_semesters_on_end_date"
    t.index ["gakki"], name: "index_semesters_on_gakki"
    t.index ["start_date"], name: "index_semesters_on_start_date"
    t.index ["year"], name: "index_semesters_on_year"
  end

  create_table "subject_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_category_id"
    t.index ["course_category_id"], name: "index_subject_categories_on_course_category_id"
    t.index ["title"], name: "index_subject_categories_on_title", unique: true
  end

  create_table "subject_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.integer "min_credit", null: false
    t.bigint "subject_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["min_credit"], name: "index_subject_groups_on_min_credit"
    t.index ["subject_category_id"], name: "index_subject_groups_on_subject_category_id"
    t.index ["title"], name: "index_subject_groups_on_title", unique: true
  end

  create_table "user_subjects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "subject_name", null: false
    t.integer "grade"
    t.integer "credits", null: false
    t.bigint "classroom_id"
    t.integer "day", null: false
    t.bigint "semester_id", null: false
    t.bigint "half_semester_id"
    t.bigint "subject_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "class_schedule_id", null: false
    t.index ["class_schedule_id"], name: "index_user_subjects_on_class_schedule_id"
    t.index ["classroom_id"], name: "index_user_subjects_on_classroom_id"
    t.index ["day"], name: "index_user_subjects_on_day"
    t.index ["grade"], name: "index_user_subjects_on_grade"
    t.index ["half_semester_id"], name: "index_user_subjects_on_half_semester_id"
    t.index ["semester_id"], name: "index_user_subjects_on_semester_id"
    t.index ["subject_group_id"], name: "index_user_subjects_on_subject_group_id"
    t.index ["subject_name"], name: "index_user_subjects_on_subject_name"
    t.index ["user_id"], name: "index_user_subjects_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "half_semesters", "semesters"
end
