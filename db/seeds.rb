# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
Faker::Config.locale = 'ca-CAT'

now = Time.now
ninety_day_ago = now - (60 * 60 * 24 * 90)

300.times do
  Cafe.create(
    name: Faker::Coffee.blend_name,
    Faker::Address.full_address,
    website: Faker::Blockchain::Bitcoin.address,
    photo:
  )

  Review.create(
    calls: [true, true, true, true, true, true, true, false, false, false].sample,
    cafe_con_leche_price: rand(1.4..2.3),
    wifi_up: rand(30..150),
    wifi_down: rand(30..300),
    power_outlets: [true, true, true, true, true, true, true, false, false, false].sample,
    natural_light: [true, true, true, true, true, true, true, false, false, false].sample,
    timestamp: rand(ninety_day_ago..now),
    stars: rand(0..5),
    food_price: rand(1..3)
  )
end
