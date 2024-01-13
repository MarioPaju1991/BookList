json.array! @bookmarks do |bookmark|
  json.extract! bookmark, :hashid
  json.book_id bookmark.book.hashid
  json.book do
    json.extract! bookmark.book, :id, :title, :author, :publisher, :genre, :image_url
  end
end
