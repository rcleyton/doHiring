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

ActiveRecord::Schema.define(version: 2023_06_15_191738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicant_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "rg"
    t.string "cpf"
    t.string "gender"
    t.string "civil_status"
    t.string "professional_goals"
    t.bigint "applicant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_id"], name: "index_applicant_profiles_on_applicant_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_applicants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true
  end

  create_table "candidatures", force: :cascade do |t|
    t.string "reason_application"
    t.bigint "applicant_profile_id", null: false
    t.bigint "vacancy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "favorite", default: false
    t.string "status", default: "Candidatura Enviada"
    t.index ["applicant_profile_id"], name: "index_candidatures_on_applicant_profile_id"
    t.index ["vacancy_id"], name: "index_candidatures_on_vacancy_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "applicant_profile_id", null: false
    t.bigint "recruiter_profile_id", null: false
    t.bigint "candidature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_profile_id"], name: "index_comments_on_applicant_profile_id"
    t.index ["candidature_id"], name: "index_comments_on_candidature_id"
    t.index ["recruiter_profile_id"], name: "index_comments_on_recruiter_profile_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.date "start_date"
    t.string "salary_offered"
    t.text "benefits_offered"
    t.text "job_functions"
    t.text "company_expectations"
    t.string "bonus"
    t.text "additional_information"
    t.bigint "candidature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "recruiter_profile_id"
    t.bigint "applicant_profile_id"
    t.string "status", default: "Aguardando resposta do candidato"
    t.index ["applicant_profile_id"], name: "index_proposals_on_applicant_profile_id"
    t.index ["candidature_id"], name: "index_proposals_on_candidature_id"
    t.index ["recruiter_profile_id"], name: "index_proposals_on_recruiter_profile_id"
  end

  create_table "recruiter_profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "document"
    t.string "phone"
    t.string "cell_phone"
    t.string "sector"
    t.integer "number_employee"
    t.bigint "recruiter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recruiter_id"], name: "index_recruiter_profiles_on_recruiter_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_recruiters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "working_model"
    t.string "salary"
    t.string "benefits"
    t.string "location"
    t.bigint "recruiter_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.bigint "vacancy_level_id"
    t.string "status", default: "Ativo"
    t.index ["recruiter_profile_id"], name: "index_vacancies_on_recruiter_profile_id"
    t.index ["vacancy_level_id"], name: "index_vacancies_on_vacancy_level_id"
  end

  create_table "vacancy_levels", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "applicant_profiles", "applicants"
  add_foreign_key "candidatures", "applicant_profiles"
  add_foreign_key "candidatures", "vacancies"
  add_foreign_key "comments", "applicant_profiles"
  add_foreign_key "comments", "candidatures"
  add_foreign_key "comments", "recruiter_profiles"
  add_foreign_key "proposals", "applicant_profiles"
  add_foreign_key "proposals", "candidatures"
  add_foreign_key "proposals", "recruiter_profiles"
  add_foreign_key "recruiter_profiles", "recruiters"
  add_foreign_key "vacancies", "recruiter_profiles"
  add_foreign_key "vacancies", "vacancy_levels"
end
