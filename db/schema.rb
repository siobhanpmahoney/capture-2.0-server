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

ActiveRecord::Schema.define(version: 2019_03_24_164409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.datetime "date_saved"
    t.datetime "date_applied"
    t.text "cover_letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_apps_on_job_id"
    t.index ["user_id"], name: "index_apps_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "link"
    t.string "title"
    t.datetime "publication_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "locations"
    t.string "industries"
    t.string "twitter"
    t.string "muse_id"
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "email"
    t.bigint "interview_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_id"], name: "index_contacts_on_interview_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.bigint "app_id"
    t.string "type"
    t.datetime "date"
    t.text "thank_you_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_interviews_on_app_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.text "contents"
    t.string "name"
    t.datetime "publication_date"
    t.string "muse_id"
    t.string "locations"
    t.string "categories"
    t.string "levels"
    t.string "landing_page"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_articles", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_tag_articles_on_article_id"
    t.index ["tag_id"], name: "index_tag_articles_on_tag_id"
  end

  create_table "tag_notes", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_tag_notes_on_note_id"
    t.index ["tag_id"], name: "index_tag_notes_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "app_id"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_tags_on_app_id"
    t.index ["company_id"], name: "index_tags_on_company_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "apps", "jobs"
  add_foreign_key "apps", "users"
  add_foreign_key "contacts", "interviews"
  add_foreign_key "interviews", "apps"
  add_foreign_key "jobs", "companies"
  add_foreign_key "tag_articles", "articles"
  add_foreign_key "tag_articles", "tags"
  add_foreign_key "tag_notes", "notes"
  add_foreign_key "tag_notes", "tags"
  add_foreign_key "tags", "apps"
  add_foreign_key "tags", "companies"
  add_foreign_key "tags", "users"
end
