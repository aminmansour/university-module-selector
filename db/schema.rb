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

ActiveRecord::Schema.define(version: 20170321201046) do

  create_table "app_settings", force: :cascade do |t|
    t.integer  "singleton_guard"
    t.boolean  "is_offline",             default: false
    t.text     "offline_message"
    t.boolean  "allow_new_registration", default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "tag_percentage_match",   default: "60.0"
    t.boolean  "disable_new_reviews",    default: false
    t.boolean  "disable_all_reviews",    default: false
    t.index ["singleton_guard"], name: "index_app_settings_on_singleton_guard", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "uni_module_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "rating"
    t.integer  "user_id"
    t.index ["uni_module_id"], name: "index_comments_on_uni_module_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "comments_users", id: false, force: :cascade do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.index ["comment_id", "user_id"], name: "index_comments_users_on_comment_id_and_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "year"
    t.integer  "duration_in_years", default: 3
  end

  create_table "courses_departments", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "department_id"
    t.index ["course_id", "department_id"], name: "index_courses_departments_on_course_id_and_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "faculty_id"
    t.index ["faculty_id"], name: "index_departments_on_faculty_id"
  end

  create_table "departments_uni_modules", id: false, force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "uni_module_id", null: false
    t.index ["department_id", "uni_module_id"], name: "index_department_uni_module"
    t.index ["uni_module_id", "department_id"], name: "index_uni_module_department"
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "year_structure_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "compulsory"
    t.integer  "min_credits"
    t.integer  "max_credits"
    t.index ["year_structure_id"], name: "index_groups_on_year_structure_id"
  end

  create_table "groups_uni_modules", id: false, force: :cascade do |t|
    t.integer "group_id",      null: false
    t.integer "uni_module_id", null: false
    t.index ["group_id", "uni_module_id"], name: "index_groups_uni_modules_on_group_id_and_uni_module_id"
    t.index ["uni_module_id", "group_id"], name: "index_groups_uni_modules_on_uni_module_id_and_group_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string   "header"
    t.integer  "department_id"
    t.string   "notice_body"
    t.date     "live_date"
    t.date     "end_date"
    t.string   "optional_link"
    t.boolean  "broadcast"
    t.boolean  "auto_delete"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pathway_search_logs", force: :cascade do |t|
    t.integer  "first_mod_id"
    t.integer  "second_mod_id"
    t.integer  "counter"
    t.integer  "department_id"
    t.integer  "course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pathways", force: :cascade do |t|
    t.string   "name",       default: "Pathway"
    t.string   "data"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "year"
    t.integer  "course_id"
  end

  create_table "reported_comments_users", id: false, force: :cascade do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.index ["comment_id", "user_id"], name: "index_reported_comments_users_on_comment_id_and_user_id"
  end

  create_table "saved_modules", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "uni_module_id"
  end

  create_table "search_logs", force: :cascade do |t|
    t.string   "search_type"
    t.integer  "counter"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "suggested_pathways", force: :cascade do |t|
    t.string   "name"
    t.string   "data"
    t.integer  "year"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_logs", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "counter"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_uni_modules", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "uni_module_id"
    t.index ["tag_id", "uni_module_id"], name: "index_tags_uni_modules_on_tag_id_and_uni_module_id"
  end

  create_table "uni_module_logs", force: :cascade do |t|
    t.integer  "counter"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "uni_module_id"
  end

  create_table "uni_module_requirements", id: false, force: :cascade do |t|
    t.integer "uni_module_id",          null: false
    t.integer "required_uni_module_id", null: false
  end

  create_table "uni_modules", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.string   "lecturers"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "pass_rate"
    t.string   "assessment_methods"
    t.string   "semester"
    t.integer  "credits"
    t.integer  "exam_percentage"
    t.integer  "coursework_percentage"
    t.string   "more_info_link"
    t.string   "assessment_dates"
  end

  create_table "uni_modules_users", id: false, force: :cascade do |t|
    t.integer "uni_module_id"
    t.integer "user_id"
    t.index ["uni_module_id", "user_id"], name: "index_uni_modules_users_on_uni_module_id_and_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_level"
    t.integer  "year_of_study"
    t.string   "course_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "department_id"
    t.integer  "faculty_id"
    t.boolean  "is_limited",        default: false
    t.datetime "last_login_time"
  end

  create_table "visitor_logs", force: :cascade do |t|
    t.string   "session_id"
    t.boolean  "logged_in"
    t.string   "device_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
  end

  create_table "year_structures", force: :cascade do |t|
    t.integer  "year_of_study"
    t.integer  "course_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "year_credits",  default: 120
    t.index ["course_id"], name: "index_year_structures_on_course_id"
  end

end
