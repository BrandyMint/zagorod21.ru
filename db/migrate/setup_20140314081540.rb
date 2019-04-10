class Setup < ActiveRecord::Migration[5.0]
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"

    create_table "active_admin_comments", force: true do |t|
      t.string   "namespace"
      t.text     "body"
      t.string   "resource_id",   null: false
      t.string   "resource_type", null: false
      t.integer  "author_id"
      t.string   "author_type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

    create_table "add_position_to_services", force: true do |t|
      t.integer  "position"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "admin_users", force: true do |t|
      t.string   "email",                  default: "",    null: false
      t.string   "encrypted_password",     default: "",    null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0,     null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "accept_orders",          default: false, null: false
      t.string   "phone"
    end

    add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

    create_table "booked_periods", force: true do |t|
      t.integer  "house_id",               null: false
      t.date     "date_from",              null: false
      t.date     "date_to",                null: false
      t.integer  "state_cd",   default: 0, null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "booked_periods", ["house_id", "date_from", "date_to"], name: "index_booked_periods_on_house_id_and_date_from_and_date_to", using: :btree
    add_index "booked_periods", ["house_id"], name: "index_booked_periods_on_house_id", using: :btree

    create_table "categories", force: true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "cities", force: true do |t|
      t.string   "title",      null: false
      t.string   "slug",       null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "cities", ["slug"], name: "index_cities_on_slug", unique: true, using: :btree
    add_index "cities", ["title"], name: "index_cities_on_title", unique: true, using: :btree

    create_table "cora_phrases", force: true do |t|
      t.string   "locale",     default: "en", null: false
      t.string   "key",                       null: false
      t.text     "value",                     null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "cora_phrases", ["locale", "key"], name: "index_cora_phrases_on_locale_and_key", unique: true, using: :btree

    create_table "houses", force: true do |t|
      t.string   "title"
      t.text     "description"
      t.decimal  "price_bd"
      t.decimal  "price_wd"
      t.decimal  "price_bd_hour"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "preview_id"
      t.integer  "capacity"
      t.integer  "resort_id"
      t.text     "summary"
      t.boolean  "active",           default: true,  null: false
      t.boolean  "selected",         default: false, null: false
      t.integer  "rooms_count"
      t.string   "accusative_title"
      t.integer  "category_id",                      null: false
    end

    create_table "images", force: true do |t|
      t.string   "file",          null: false
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "resource_type", null: false
      t.integer  "resource_id",   null: false
    end

    add_index "images", ["resource_type", "resource_id"], name: "index_images_on_resource_type_and_resource_id", using: :btree

    create_table "meta_tag_pages", force: true do |t|
      t.string   "path",                        null: false
      t.string   "site"
      t.string   "title"
      t.text     "keywords"
      t.text     "description"
      t.boolean  "noindex",     default: false, null: false
      t.boolean  "nofollow",    default: false, null: false
      t.string   "canonical"
      t.string   "prefix"
      t.string   "separator"
      t.string   "suffix"
      t.string   "prev"
      t.string   "next"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "notes", force: true do |t|
      t.text     "text"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "orders", force: true do |t|
      t.integer  "house_id"
      t.string   "phone"
      t.string   "name"
      t.string   "state"
      t.datetime "date_from"
      t.date     "date_to"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "people_quantity"
      t.decimal  "money_amount"
      t.string   "email"
      t.string   "type"
      t.text     "description"
    end

    add_index "orders", ["house_id"], name: "index_orders_on_house_id", using: :btree

    create_table "pages", force: true do |t|
      t.string  "title",      null: false
      t.string  "slug",       null: false
      t.text    "body",       null: false
      t.string  "template"
      t.integer "preview_id"
      t.boolean "carousel"
    end

    create_table "phrasing_phrase_versions", force: true do |t|
      t.string   "phrasing_phrase_id"
      t.text     "value"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "resorts", force: true do |t|
      t.string   "title",                       null: false
      t.text     "description"
      t.decimal  "distance"
      t.decimal  "time"
      t.text     "map_iframe"
      t.integer  "preview_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "site"
      t.text     "summary"
      t.boolean  "active",      default: true,  null: false
      t.boolean  "highlighted", default: false
      t.integer  "city_id"
      t.string   "price_range"
    end

    add_index "resorts", ["city_id"], name: "index_resorts_on_city_id", using: :btree

    create_table "services", force: true do |t|
      t.string   "title",                      null: false
      t.string   "price",                      null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "key",                        null: false
      t.text     "summary"
      t.boolean  "main",       default: false, null: false
      t.integer  "position",   default: 0,     null: false
    end

    add_index "services", ["key"], name: "index_services_on_key", unique: true, using: :btree

    create_table "taggings", force: true do |t|
      t.integer  "tag_id"
      t.integer  "taggable_id"
      t.string   "taggable_type"
      t.integer  "tagger_id"
      t.string   "tagger_type"
      t.string   "context",       limit: 128
      t.datetime "created_at"
    end

    add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

    create_table "tags", force: true do |t|
      t.string  "name"
      t.boolean "active", default: true
    end

  end
end
