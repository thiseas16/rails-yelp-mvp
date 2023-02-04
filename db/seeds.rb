# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Cleaning out the database'

Review.delete_all
Restaurant.delete_all

puts 'Populating Database'
5.times do
  restaurant_ref = Restaurant.create(
    name: Faker::Restaurant.name,
    category: %w[chinese italian japanese french belgian].sample,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  5.times do
    Review.create(rating: rand(6), content: Faker::Lorem.paragraph, restaurant: restaurant_ref)
  end
end

puts "Added #{Restaurant.count} restaurants to the database!"
puts "Added #{Review.count} total reviews to the database!"
