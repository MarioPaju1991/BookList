json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.author book.author
  json.publisher book.publisher
  json.genre book.genre
  json.image_url book.image_url
end
