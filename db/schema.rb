ActiveRecord::Schema.define(version: 2021_06_17_030338) do
  enable_extension "plpgsql"
  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "feed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_favorites_on_feed_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.text "image"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_feeds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.text "image"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "favorites", "feeds"
  add_foreign_key "favorites", "users"
  add_foreign_key "feeds", "users"
end
