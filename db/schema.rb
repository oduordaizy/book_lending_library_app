ActiveRecord::Schema[8.0].define(version: 2025_02_17_155455) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lending_histories", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "borrower_name"
    t.datetime "borrowed_at"
    t.datetime "returned_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_lending_histories_on_book_id"
  end

  add_foreign_key "lending_histories", "books"
end
