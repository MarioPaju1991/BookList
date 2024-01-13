FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    publisher { Faker::Book.publisher }
    genre { Faker::Book.genre }
    image_url { 'https://res.cloudinary.com/daktzdqij/image/upload/v1704948826/bookcover-placeholder_djass8.jpg' }
    hashid { Hashid.new.encode(SecureRandom.uuid.to_i) } # Include this line to generate a Hashid
  end
end
