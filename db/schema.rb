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

ActiveRecord::Schema.define(version: 20170224034751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", id: :string, default: -> { "get_uuid()" }, force: :cascade do |t|
    t.date     "day",         null: false
    t.time     "starttime",   null: false
    t.string   "status",      null: false
    t.text     "comments"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "patient_id",  null: false
    t.string   "research_id", null: false
    t.string   "center_id",   null: false
  end

  create_table "centers", id: :string, default: -> { "get_uuid()" }, force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "centers_unique_code", unique: true, using: :btree
  end

  create_table "evaluations", id: :string, default: -> { "get_uuid()" }, force: :cascade do |t|
    t.string   "var_fr"
    t.string   "var_acpa"
    t.string   "var_tnfa"
    t.string   "var_il6"
    t.string   "var_pcr"
    t.string   "var_das28"
    t.string   "var_vsg"
    t.string   "var_haq"
    t.string   "var_vop"
    t.string   "var_iac"
    t.string   "var_ic"
    t.string   "var_ta"
    t.string   "var_fc"
    t.string   "var_temp"
    t.string   "var_lip"
    t.string   "var_ct"
    t.string   "var_tg"
    t.string   "var_ldl"
    t.string   "var_vldl"
    t.string   "var_hdl"
    t.string   "var_glu"
    t.string   "var_peso"
    t.string   "var_talla"
    t.string   "var_imc"
    t.string   "var_cc"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "appointment_id", null: false
    t.string   "center_id",      null: false
    t.string   "var_fresp"
    t.string   "research_id",    null: false
  end

  create_table "patients", id: :string, default: -> { "get_uuid()" }, force: :cascade do |t|
    t.string   "code",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "research_id", null: false
    t.string   "person_id",   null: false
    t.string   "center_id",   null: false
    t.index ["person_id", "research_id"], name: "patients_unique_person_research", unique: true, using: :btree
  end

  create_table "people", id: :string, default: -> { "get_uuid()" }, force: :cascade do |t|
    t.string   "code",                   null: false
    t.date     "elaborationdate",        null: false
    t.string   "firstname",              null: false
    t.string   "lastname",               null: false
    t.date     "birthdate"
    t.integer  "age"
    t.string   "gender"
    t.string   "maritalstatus"
    t.string   "occupation"
    t.string   "education"
    t.string   "birthplace"
    t.string   "address1"
    t.string   "address2"
    t.string   "region"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "center_id",              null: false
    t.string   "arcode"
    t.string   "health_status"
    t.string   "obesity"
    t.string   "dm2"
    t.string   "hta"
    t.string   "ecv"
    t.string   "iam"
    t.string   "irc"
    t.string   "evc"
    t.string   "cancer"
    t.string   "hypercholesterolemia"
    t.string   "p_medications"
    t.string   "p_smoking"
    t.string   "p_alcoholism"
    t.string   "p_addictions"
    t.string   "p_obesity"
    t.string   "p_dm2"
    t.string   "p_hta"
    t.string   "p_ecv"
    t.string   "p_iam"
    t.string   "p_irc"
    t.string   "p_evc"
    t.string   "p_cancer"
    t.string   "p_hypercholesterolemia"
    t.string   "p_antobst"
    t.string   "p_menarche"
    t.string   "p_ritmo"
    t.string   "p_fum"
    t.string   "p_hormones"
    t.string   "p_diagnosisdate"
    t.string   "p_disease_startdate"
    t.index ["code"], name: "people_unique_code", unique: true, using: :btree
  end

  create_table "researches", id: :string, default: -> { "get_uuid()" }, force: :cascade do |t|
    t.string   "code",        null: false
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "user_id",     null: false
    t.string   "center_id",   null: false
    t.index ["code"], name: "researches_unique_code", unique: true, using: :btree
  end

  create_table "users", id: :string, default: -> { "get_uuid()" }, force: :cascade do |t|
    t.string   "firstname",                       null: false
    t.string   "lastname",                        null: false
    t.string   "email",                           null: false
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.boolean  "isadmin",         default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "center_id",                       null: false
    t.index ["username"], name: "users_unique_username", unique: true, using: :btree
  end

  add_foreign_key "appointments", "centers", name: "appointments_center_fk"
  add_foreign_key "appointments", "patients", name: "appointments_patient_fk"
  add_foreign_key "appointments", "researches", name: "appointments_research_fk"
  add_foreign_key "evaluations", "appointments", name: "evaluations_appointment_fk"
  add_foreign_key "evaluations", "centers", name: "evaluations_center_fk"
  add_foreign_key "evaluations", "researches", name: "evaluations_research_fk"
  add_foreign_key "patients", "centers", name: "patients_center_fk"
  add_foreign_key "patients", "people", name: "patients_people_fk"
  add_foreign_key "patients", "researches", name: "patients_researches_fk"
  add_foreign_key "people", "centers", name: "people_center_fk"
  add_foreign_key "researches", "centers", name: "researches_center_fk"
  add_foreign_key "researches", "users", name: "researches_user_fk"
  add_foreign_key "users", "centers", name: "users_center_fk"
end
