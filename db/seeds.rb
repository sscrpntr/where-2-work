require 'faker'
require "csv"
require "open-uri"
Faker::Config.locale = 'ca-CAT'

now = Time.now
ninety_day_ago = now - (60 * 60 * 24 * 90)
venue_photos = []
csv_text = File.read(Rails.root.join('lib','seeds','cafe_photos.csv'))
csv = CSV.parse(csv_text, encoding: 'UTF-8')
csv.each do |row|
  venue_photos << row
end
puts venue_photos
user_photos = []

# 100.times do
#   Venue.create(
#     name: Faker::Coffee.blend_name,
#     Faker::Address.full_address,
#     website: Faker::Blockchain::Bitcoin.address,
#     photo: ,
#   )
# end
# # OFFERS ?
# 300.times do
#   Review.create(
#     calls: [true, true, true, true, true, true, true, false, false, false].sample,
#     cafe_con_leche_price: rand(1.4..2.3),
#     wifi: [rand(30..300), rand(30..150)],
#     power_outlets: [true, true, true, true, true, true, true, false, false, false].sample,
#     natural_light: [true, true, true, true, true, true, true, false, false, false].sample,
#     timestamp: rand(ninety_day_ago..now),
#     stars: rand(0..5),
#     food_price: ["cheap", "normal", "expensive"].sample
#   )
# end

# 200.times do
#   name = Faker::Name.name,
#   User.create(
#     owner: false,
#     name: name,
#     username: name.strip,
#     email: Faker::Internet.email,
#     password: Faker::Blockchain::Bitcoin.address
#   )
# end
# x = 0
# while x < 20
#   name = Faker::Name.name,
#   User.create(
#     owner: true,
#     name: name,
#     username: name.strip,
#     email: Faker::Internet.email,
#     password: Faker::Blockchain::Bitcoin.address,
#     venue_owned: x
#   )
#   x += 1
# end
