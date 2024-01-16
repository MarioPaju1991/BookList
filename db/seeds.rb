# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clearing the existing data
puts("cleaning the db...")
Book.destroy_all
Bookmark.destroy_all
User.destroy_all

# Creating users
user1 = User.create(
  email: 'study@valley.com',
  password: 'studyvalley',
  first_name: 'Study',
  last_name: 'Valley'
)

user2 = User.create(
  email: 'mario@example.com',
  password: 'password',
  first_name: 'Mario',
  last_name: 'Paju'
)

# Creating books by using the Faker gem
# Using temporary placeholder uploaded in Cloudinary for books image picture
15.times do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    publisher: Faker::Book.publisher,
    genre: Faker::Book.genre,
    image_url: 'https://res.cloudinary.com/daktzdqij/image/upload/v1704948826/bookcover-placeholder_djass8.jpg'
  )
end

# Creating random 6 different books already to exist in two different users bookmark
# Selecting random books for user1
user1_books = Book.all.sample(3)
user1.books << user1_books

# Selecting random books for user2
user2_books = Book.all.sample(3)
user2.books << user2_books
puts("finished creating the db...")
