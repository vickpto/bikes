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

ActiveRecord::Schema.define(version: 20141020184336) do

  create_table "articles", force: true do |t|
    t.integer "articleId",                  null: false
    t.string  "articleTitle",    limit: 50, null: false
    t.integer "managerId",                  null: false
    t.date    "publicationDate",            null: false
    t.text    "body",                       null: false
    t.text    "summary",                    null: false
  end

  create_table "clients", force: true do |t|
    t.integer "personId",                                null: false
    t.integer "document",                                null: false
    t.string  "personName",   limit: 50,                 null: false
    t.string  "lastName",     limit: 50,                 null: false
    t.string  "telephone",    limit: 20,                 null: false
    t.boolean "personStatus",                            null: false
    t.date    "birthDay",                                null: false
    t.boolean "publicity",               default: false
    t.string  "email",        limit: 50,                 null: false
  end

  create_table "contract_histories", force: true do |t|
    t.integer "personId",          null: false
    t.date    "contractDate",      null: false
    t.date    "finalContractDate"
  end

  create_table "inventories", force: true do |t|
    t.integer "productAmount",  null: false
    t.integer "productId",      null: false
    t.date    "agregationDate", null: false
  end

  create_table "items", force: true do |t|
    t.integer "saleId",     null: false
    t.integer "productId",  null: false
    t.integer "itemAmount", null: false
  end

  create_table "products", force: true do |t|
    t.integer  "productId",                      null: false
    t.string   "productReference",   limit: 10,  null: false
    t.string   "productName",        limit: 50,  null: false
    t.string   "productTradeMark",   limit: 50,  null: false
    t.integer  "productPrice",                   null: false
    t.boolean  "productStatus",                  null: false
    t.string   "productDescription", limit: 300, null: false
    t.string   "typeProduct",        limit: 10,  null: false
    t.string   "measures",           limit: 50
    t.string   "bikeType",           limit: 50
    t.string   "size",               limit: 2
    t.string   "gender",             limit: 1
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer "saleId",                 null: false
    t.integer "sellerId",               null: false
    t.integer "clientId",               null: false
    t.date    "saleDate",               null: false
    t.boolean "saleStatus",             null: false
    t.string  "note",       limit: 300, null: false
  end

  create_table "sellers", force: true do |t|
<<<<<<< HEAD
    t.integer "personId",                         null: false
    t.integer "document",                         null: false
    t.string  "username",              limit: 50, null: false
    t.string  "userLastName",          limit: 50, null: false
    t.string  "email",                 limit: 50, null: false
    t.string  "password",                         null: false
    t.string  "telephone",             limit: 20, null: false
    t.string  "userType",              limit: 10, null: false
    t.boolean "status",                           null: false
=======
    t.integer "personId",                null: false
    t.integer "document",                null: false
    t.string  "username",     limit: 50, null: false
    t.string  "userLastName", limit: 50, null: false
    t.string  "email",        limit: 50, null: false
    t.string  "password",                null: false
    t.string  "telephone",    limit: 20, null: false
    t.string  "userType",     limit: 10, null: false
    t.boolean "status",                  null: false
>>>>>>> 68aeda68bf24441b0c4b9ab33d044327d55c234b
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "personId",                                       null: false
    t.string   "username",               limit: 50,              null: false
    t.string   "userLastName",           limit: 50,              null: false
    t.integer  "document",                                       null: false
    t.string   "telephone",              limit: 20,              null: false
    t.string   "userType",                                       null: false
    t.boolean  "status",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
