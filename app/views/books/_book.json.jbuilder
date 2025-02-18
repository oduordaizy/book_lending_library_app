json.extract! book, :id, :title, :author, :available, :created_at, :updated_at
json.url book_url(book, format: :json)
