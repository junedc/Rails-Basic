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

ActiveRecord::Schema.define(version: 20170509003650) do

  create_table "app_coupon", primary_key: "app_coupon_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "active_from"
    t.datetime "active_to"
    t.string   "coupon_code",        limit: 20,  default: "0", null: false
    t.string   "public_description", limit: 200, default: "0", null: false
    t.integer  "free_trial_length",              default: 7,   null: false, comment: "in days"
    t.datetime "date_created",                                 null: false
    t.datetime "date_deleted"
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slug",       limit: 50
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",       limit: 50, null: false
    t.integer "country_id"
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",       limit: 50, null: false
    t.integer "population"
  end

  create_table "examples", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city",       limit: 50
    t.string "custname",   limit: 50
    t.float  "latitude",   limit: 24
    t.float  "longtitude", limit: 24
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "favorite_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "shopify_domain",                                                                       null: false
    t.string   "shopify_token",                                                                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "google_maps_api_key",       limit: 45
    t.string   "popover_template_html",     limit: 2000
    t.string   "map_page_content_type",     limit: 45,                           default: "text/html"
    t.integer  "google_maps_start_zoom",                                         default: 11
    t.float    "google_maps_start_lat",     limit: 24,                           default: 40.7128
    t.float    "google_maps_start_lng",     limit: 24,                           default: -74.0059
    t.integer  "map_control_zoomcontrol",                                        default: 0
    t.integer  "map_control_maptype",                                            default: 0
    t.integer  "orders_include_examples",                                        default: 1
    t.integer  "map_height",                                                     default: 100
    t.integer  "include_shop_script",                                            default: 0
    t.string   "shopify_plan",              limit: 50
    t.decimal  "shopify_monthly_charge",                 precision: 6, scale: 2, default: "0.0"
    t.datetime "deleted_at"
    t.integer  "order_display_time_secs",                                        default: 3
    t.integer  "signup_app_coupon_id"
    t.string   "country_code",              limit: 10
    t.string   "email",                     limit: 100
    t.string   "customer_email",            limit: 100
    t.string   "password_enabled",          limit: 50
    t.string   "shop_owner",                limit: 150
    t.string   "setup_required",            limit: 50
    t.datetime "shop_created_at"
    t.string   "domain",                    limit: 80
    t.integer  "max_order_display_at_time",                                      default: 3
  end

  create_table "token_storages", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "expiration"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

end
