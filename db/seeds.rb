# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Create the main sample brewery

Brewery.create!(
  name: "Dominion City Brewing Co.",
  address: "5510 Canotek Rd Unit 15, Gloucester",
  city: "Ottawa",
  taproom: true,
  restaurant: true,
  website: "https://www.dominioncity.ca/pages/our-beer",
)

# Generate more additional breweries
30.times do |n|
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

# Main sample beer

Beer.create!(
  name: "Trouble in the fields",
  style: "laurentian adjust lager",
  ibu: 70,
  abv: "4.5%",
  brewery_id: 1,
)

# More beers attached to random breweries

300.times do |n|
  name = "#{Faker::Beer.name}##{n}"
  style = Faker::Beer.style
  ibu = Faker::Beer.ibu.split(' ')[0]
  abv = Faker::Beer.alcohol
  Beer.create!(
    name: name,
    style: style,
    ibu: ibu,
    abv: abv,
    brewery_id: rand(1..30),
  )
end
