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

ActiveRecord::Schema.define(version: 2018_09_01_121210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "applied_jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "job_id"
    t.float "applicant_exp"
    t.float "expected_ctc"
    t.integer "notice_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applied_jobs_on_job_id"
    t.index ["user_id"], name: "index_applied_jobs_on_user_id"
  end

  create_table "job_sectors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "company_name"
    t.string "job_title"
    t.string "job_location"
    t.string "salary"
    t.string "experience"
    t.uuid "user_id"
    t.uuid "job_sector_id"
    t.uuid "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_sector_id"], name: "index_jobs_on_job_sector_id"
    t.index ["skill_id"], name: "index_jobs_on_skill_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "scheduled_interviews", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "job_id"
    t.datetime "interview_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_scheduled_interviews_on_job_id"
    t.index ["user_id"], name: "index_scheduled_interviews_on_user_id"
  end

  create_table "skills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "job_sector_id"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_sector_id"], name: "index_skills_on_job_sector_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "mobile"
    t.string "dob"
    t.string "gender"
    t.string "address"
    t.string "latitude"
    t.string "longitude"
    t.string "role"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applied_jobs", "jobs"
  add_foreign_key "applied_jobs", "users"
  add_foreign_key "jobs", "job_sectors"
  add_foreign_key "jobs", "skills"
  add_foreign_key "jobs", "users"
  add_foreign_key "scheduled_interviews", "jobs"
  add_foreign_key "scheduled_interviews", "users"
  add_foreign_key "skills", "job_sectors"
end
