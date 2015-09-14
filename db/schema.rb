# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150914141011) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assets", force: :cascade do |t|
    t.string   "storage_uid",          limit: 255
    t.string   "storage_name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "storage_width",        limit: 4
    t.integer  "storage_height",       limit: 4
    t.float    "storage_aspect_ratio", limit: 24
    t.integer  "storage_depth",        limit: 4
    t.string   "storage_format",       limit: 255
    t.string   "storage_mime_type",    limit: 255
    t.string   "storage_size",         limit: 255
  end

  create_table "authorities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "authorities", ["role_id"], name: "index_authorities_on_role_id", using: :btree
  add_index "authorities", ["user_id", "role_id"], name: "index_authorities_on_user_id_and_role_id", using: :btree
  add_index "authorities", ["user_id"], name: "index_authorities_on_user_id", using: :btree

  create_table "black_lists", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "ip",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "carts", ["id"], name: "index_carts_on_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "ancestry",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "cart_id",    limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "order_id",   limit: 4
    t.integer  "quantity",   limit: 4, default: 1
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "marks", ["product_id"], name: "index_marks_on_product_id", using: :btree
  add_index "marks", ["user_id", "product_id"], name: "index_marks_on_user_id_and_product_id", using: :btree
  add_index "marks", ["user_id"], name: "index_marks_on_user_id", using: :btree

  create_table "mayun", id: false, force: :cascade do |t|
    t.integer  "id",         limit: 4,   default: 0, null: false
    t.string   "buyer",      limit: 255
    t.string   "phone",      limit: 255
    t.string   "address",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "buyer",      limit: 255
    t.string   "phone",      limit: 255
    t.string   "address",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.decimal  "price",                         precision: 8, scale: 2
    t.integer  "inventory",    limit: 4
    t.text     "introduction", limit: 16777215
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "picture",      limit: 255
    t.integer  "category_id",  limit: 4
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["id"], name: "index_products_on_id", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["price"], name: "index_products_on_price", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nick_name",              limit: 255
    t.string   "address",                limit: 255
    t.string   "phone",                  limit: 255
    t.string   "real_name",              limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "sex",                    limit: 255
    t.string   "s_province",             limit: 255
    t.string   "s_city",                 limit: 255
    t.string   "s_county",               limit: 255
    t.integer  "age",                    limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id"], name: "index_users_on_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
