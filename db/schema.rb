# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_23_142405) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "announcements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message"
    t.date "starts_at"
    t.date "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_configs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "upcoming_checkin_email_active", default: true
    t.boolean "reservation_confirmation_email_active", default: true
    t.string "site_title", null: false
    t.string "admin_email", null: false
    t.string "department_name", null: false
    t.string "contact_link_location", null: false
    t.string "home_link_text", null: false
    t.string "home_link_location", null: false
    t.integer "default_per_cat_page"
    t.text "upcoming_checkin_email_body", null: false
    t.text "overdue_checkin_email_body", null: false
    t.boolean "overdue_checkin_email_active", default: true
    t.text "terms_of_service", null: false
    t.text "deleted_missed_reservation_email_body", null: false
    t.boolean "send_notifications_for_deleted_missed_reservations", default: true
    t.boolean "checkout_persons_can_edit", default: false
    t.boolean "require_phone", default: false
    t.boolean "viewed", default: true
    t.boolean "override_on_create", default: false
    t.boolean "override_at_checkout", default: false
    t.integer "blackout_exp_time"
    t.text "request_text", null: false
    t.boolean "enable_renewals", default: true
    t.boolean "enable_new_users", default: true
    t.integer "res_exp_time"
    t.boolean "enable_guests", default: true
    t.boolean "upcoming_checkout_email_active", default: true
    t.text "upcoming_checkout_email_body"
    t.boolean "notify_admin_on_create", default: false
    t.boolean "disable_user_emails", default: false
    t.boolean "autodeactivate_on_archive", default: false
    t.boolean "requests_affect_availability", default: false
  end

  create_table "blackouts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.text "notice"
    t.integer "created_by"
    t.text "blackout_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "set_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "max_per_user"
    t.integer "max_checkout_length"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "sort_order"
    t.datetime "deleted_at"
    t.integer "max_renewal_times"
    t.integer "max_renewal_length"
    t.integer "renewal_days_before_due"
    t.boolean "csv_import", default: false, null: false
  end

  create_table "checkin_procedures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "equipment_model_id"
    t.string "step"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "checkout_procedures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "equipment_model_id"
    t.string "step"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "equipment_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "serial"
    t.boolean "active", default: true
    t.integer "equipment_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.boolean "csv_import", default: false, null: false
    t.string "deactivation_reason"
    t.text "notes", size: :medium, null: false
  end

  create_table "equipment_models", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "late_fee", precision: 10, scale: 2
    t.decimal "replacement_fee", precision: 10, scale: 2
    t.integer "max_per_user"
    t.boolean "active", default: true
    t.integer "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer "max_renewal_times"
    t.integer "max_renewal_length"
    t.integer "renewal_days_before_due"
    t.boolean "csv_import", default: false, null: false
    t.integer "max_checkout_length"
    t.integer "equipment_items_count", default: 0, null: false
    t.decimal "late_fee_max", precision: 10, scale: 2, default: "0.0"
    t.integer "overdue_count", default: 0, null: false
  end

  create_table "equipment_models_associated_equipment_models", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "equipment_model_id"
    t.integer "associated_equipment_model_id"
  end

  create_table "equipment_models_requirements", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "requirement_id", null: false
    t.integer "equipment_model_id", null: false
  end

  create_table "requirements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "equipment_model_id"
    t.string "contact_name"
    t.string "contact_info"
    t.datetime "deleted_at"
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "description"
  end

  create_table "reservations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "reserver_id"
    t.integer "checkout_handler_id"
    t.integer "checkin_handler_id"
    t.date "start_date"
    t.date "due_date"
    t.datetime "checked_out"
    t.datetime "checked_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "equipment_model_id"
    t.integer "equipment_item_id"
    t.text "notes"
    t.boolean "notes_unsent", default: false
    t.integer "times_renewed"
    t.integer "status", default: 0
    t.boolean "overdue", default: false
    t.integer "flags", default: 1
  end

  create_table "sessions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id"
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "nickname", default: "", null: false
    t.string "phone"
    t.string "email"
    t.string "affiliation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "terms_of_service_accepted"
    t.string "view_mode", default: "normal"
    t.string "role", default: "normal"
    t.boolean "missing_phone", default: false
    t.string "encrypted_password", limit: 128, default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "cas_login"
    t.datetime "remember_created_at"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_requirements", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "requirement_id"
  end

  create_table "versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
