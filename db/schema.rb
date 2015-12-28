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

ActiveRecord::Schema.define(version: 20151222092021) do

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

  create_table "authorities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "authorities", ["role_id"], name: "index_authorities_on_role_id", using: :btree
  add_index "authorities", ["user_id", "role_id"], name: "index_authorities_on_user_id_and_role_id", using: :btree
  add_index "authorities", ["user_id"], name: "index_authorities_on_user_id", using: :btree

  create_table "award_items", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "expire_at"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "award_items", ["user_id"], name: "index_award_items_on_user_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "quantity",   limit: 4
    t.datetime "expire_at"
    t.integer  "odds",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "ancestry",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content",          limit: 65535
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "verify_code", limit: 255
    t.integer  "value",       limit: 4
    t.datetime "expire_at"
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "coupons", ["user_id"], name: "index_coupons_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "quantity",   limit: 4, default: 1
    t.integer  "product_id", limit: 4
    t.integer  "cart_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "items", ["cart_id"], name: "index_items_on_cart_id", using: :btree
  add_index "items", ["order_id"], name: "index_items_on_order_id", using: :btree
  add_index "items", ["product_id"], name: "index_items_on_product_id", using: :btree

  create_table "marks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "marks", ["product_id"], name: "index_marks_on_product_id", using: :btree
  add_index "marks", ["user_id", "product_id"], name: "index_marks_on_user_id_and_product_id", using: :btree
  add_index "marks", ["user_id"], name: "index_marks_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "buyer",      limit: 255
    t.string   "phone",      limit: 255
    t.string   "address",    limit: 255
    t.decimal  "total",                  precision: 8, scale: 2, null: false
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.decimal  "price",                      precision: 8, scale: 2
    t.integer  "inventory",    limit: 4
    t.text     "introduction", limit: 65535
    t.string   "picture",      limit: 255
    t.integer  "sales",        limit: 4,                             default: 0
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "category_id",  limit: 4
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["price"], name: "index_products_on_price", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nick_name",              limit: 255
    t.string   "address",                limit: 255
    t.string   "phone",                  limit: 255
    t.string   "real_name",              limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "status",                 limit: 255
    t.decimal  "score",                              precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.string   "email",                  limit: 255,                         default: "",  null: false
    t.string   "encrypted_password",     limit: 255,                         default: "",  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,                           default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "sex",                    limit: 255
    t.string   "s_province",             limit: 255
    t.string   "s_city",                 limit: 255
    t.string   "s_county",               limit: 255
    t.integer  "age",                    limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
