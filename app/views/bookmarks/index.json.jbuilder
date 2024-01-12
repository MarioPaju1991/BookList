json.array! @bookmarks do |bookmark|
  json.extract! bookmark, :id, :book_id
  json.book do
    json.extract! bookmark.book, :id, :title, :author, :publisher, :genre, :image_url
  end
end
