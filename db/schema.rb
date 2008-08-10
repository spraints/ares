# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080810002109) do

  create_table "academy_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "course_session_id", :null => false
    t.string   "name",              :null => false
    t.text     "description"
    t.integer  "maximum_points",    :null => false
    t.date     "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_sessions", :force => true do |t|
    t.integer  "acaedmy_session_id", :null => false
    t.integer  "course_id",          :null => false
    t.string   "section_number"
    t.string   "note"
    t.text     "syllabus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.integer  "field_of_study_id", :null => false
    t.string   "name",              :null => false
    t.string   "number",            :null => false
    t.text     "description"
    t.text     "syllabus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "field_of_studies", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "abbreviation", :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "assignment_id", :null => false
    t.integer  "student_id",    :null => false
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.integer  "employee_id",        :null => false
    t.integer  "course_session_id",  :null => false
    t.string   "final_letter_grade"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
