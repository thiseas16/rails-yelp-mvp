# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Cleaning out the database'
Restaurant.delete_all

puts 'Populating Database'
5.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    category: Faker::Restaurant.type,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end

puts "Added #{Restaurant.count} restaurants to the database!"
