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

ActiveRecord::Schema[7.1].define(version: 2023_10_23_141326) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
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
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "postal_code"
    t.string "street"
    t.integer "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.bigint "recruiter_profile_id"
    t.bigint "applicant_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_profile_id"], name: "index_addresses_on_applicant_profile_id"
    t.index ["recruiter_profile_id"], name: "index_addresses_on_recruiter_profile_id"
  end

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_applicant_profiles_on_applicant_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_applicants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true
  end

  create_table "candidatures", force: :cascade do |t|
    t.string "reason_application"
    t.bigint "applicant_profile_id", null: false
    t.bigint "vacancy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_profile_id"], name: "index_comments_on_applicant_profile_id"
    t.index ["candidature_id"], name: "index_comments_on_candidature_id"
    t.index ["recruiter_profile_id"], name: "index_comments_on_recruiter_profile_id"
  end

  create_table "education_levels", force: :cascade do |t|
    t.string "course_name"
    t.integer "course_type"
    t.string "institution_name"
    t.integer "course_status"
    t.date "start_date"
    t.date "end_date"
    t.date "expected_end_date"
    t.bigint "applicant_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_profile_id"], name: "index_education_levels_on_applicant_profile_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recruiter_profile_id"
    t.bigint "applicant_profile_id"
    t.string "status", default: "Aguardando resposta do candidato"
    t.index ["applicant_profile_id"], name: "index_proposals_on_applicant_profile_id"
    t.index ["candidature_id"], name: "index_proposals_on_candidature_id"
    t.index ["recruiter_profile_id"], name: "index_proposals_on_recruiter_profile_id"
  end

  create_table "recruiter_profiles", force: :cascade do |t|
    t.string "legal_name"
    t.string "document"
    t.string "phone"
    t.string "cell_phone"
    t.string "sector"
    t.integer "number_employee"
    t.bigint "recruiter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "about_us"
    t.string "trade_name"
    t.index ["recruiter_id"], name: "index_recruiter_profiles_on_recruiter_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_recruiters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "working_model"
    t.string "salary"
    t.string "location"
    t.bigint "recruiter_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.bigint "vacancy_level_id"
    t.string "status", default: "Ativo"
    t.text "requirements"
    t.text "desired_skill"
    t.string "contract_type"
    t.index ["recruiter_profile_id"], name: "index_vacancies_on_recruiter_profile_id"
    t.index ["vacancy_level_id"], name: "index_vacancies_on_vacancy_level_id"
  end

  create_table "vacancy_benefits", force: :cascade do |t|
    t.string "benefit_name"
    t.bigint "vacancy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vacancy_id"], name: "index_vacancy_benefits_on_vacancy_id"
  end

  create_table "vacancy_levels", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "applicant_profiles"
  add_foreign_key "addresses", "recruiter_profiles"
  add_foreign_key "applicant_profiles", "applicants"
  add_foreign_key "candidatures", "applicant_profiles"
  add_foreign_key "candidatures", "vacancies"
  add_foreign_key "comments", "applicant_profiles"
  add_foreign_key "comments", "candidatures"
  add_foreign_key "comments", "recruiter_profiles"
  add_foreign_key "education_levels", "applicant_profiles"
  add_foreign_key "proposals", "applicant_profiles"
  add_foreign_key "proposals", "candidatures"
  add_foreign_key "proposals", "recruiter_profiles"
  add_foreign_key "recruiter_profiles", "recruiters"
  add_foreign_key "vacancies", "recruiter_profiles"
  add_foreign_key "vacancies", "vacancy_levels"
  add_foreign_key "vacancy_benefits", "vacancies"
end
