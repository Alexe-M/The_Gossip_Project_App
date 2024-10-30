# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# rails db:drop db:create db:migrate

# remove database
PrivateMessage.destroy_all
Comment.destroy_all  # Détruire les commentaires avant les utilisateurs
Like.destroy_all     # Détruire les likes avant les utilisateurs
Gossip.destroy_all
Tag.destroy_all
User.destroy_all
City.destroy_all


# Create Cities
10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

# Create Users
10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(18..70),
    city: City.all.sample
  )
end

# Create Gossips
20.times do
  Gossip.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user: User.all.sample
  )
end

# Create Tags
10.times do
  Tag.create(title: "##{Faker::Lorem.word}")
end

# Assign tags to gossips
Gossip.all.each do |gossip|
  gossip.tags << Tag.all.sample(rand(1..3))
end

# Create PrivateMessages
5.times do
  PrivateMessage.create(
    content: Faker::Lorem.sentence,
    sender: User.all.sample,
    receiver: User.all.sample
  )
end

# Create Comments
20.times do
  Comment.create(
    content: Faker::Lorem.sentence,
    user: User.all.sample,
    gossip: Gossip.all.sample
  )
end

# Create Likes
20.times do
  Like.create(
    user: User.all.sample,
    gossip: Gossip.all.sample # Adjusted to remove comment reference
  )
end
