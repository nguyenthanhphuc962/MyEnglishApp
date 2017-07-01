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

ActiveRecord::Schema.define(version: 20170624103236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.integer  "is_correct"
    t.text     "content"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_choices_on_question_id", using: :btree
  end

  create_table "exams", force: :cascade do |t|
    t.string   "name"
    t.integer  "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "exam_id"
    t.index ["exam_id"], name: "index_questions_on_exam_id", using: :btree
  end

  create_table "test_details", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "exam_id"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_test_details_on_exam_id", using: :btree
    t.index ["test_id", "exam_id"], name: "index_test_details_on_test_id_and_exam_id", unique: true, using: :btree
    t.index ["test_id"], name: "index_test_details_on_test_id", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "date_test"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tests_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "choices", "questions"
  add_foreign_key "questions", "exams"
  add_foreign_key "test_details", "exams"
  add_foreign_key "test_details", "tests"
  add_foreign_key "tests", "users"
end
