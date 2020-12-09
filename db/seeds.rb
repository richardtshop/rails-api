# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# Create the main sample brewery

Brewery.create!(
  name: "Dominion City Brewing Co.",
  address: "5510 Canotek Rd Unit 15, Gloucester",
  city: "Ottawa",
  taproom: true,
  restaurant: true,
  website: "https://www.dominioncity.ca/pages/our-beer",
)


# Generate more additional users.
60.times do |n|
  name = Faker::Company.name
  address = Faker::Address.street_address
  city = Faker::Address.city
  taproom = Faker::Boolean.boolean
  restaurant = Faker::Boolean.boolean
  website = Faker::Internet.url
  Brewery.create!(
    name: name,
    address: address,
    city: city,
    taproom: taproom,
    restaurant: restaurant,
    website: website,
  )
end
