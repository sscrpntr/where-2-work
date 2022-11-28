require 'faker'
require "csv"
require "open-uri"

Faker::Config.locale = "ca-CAT"

# now = Time.now
# ninety_day_ago = now - (60 * 60 * 24 * 90)

venue_photos = []
csv_text = File.read(Rails.root.join('lib','seeds','cafe_photos.csv'))
csv = CSV.parse(csv_text, encoding: 'UTF-8')
csv.each do |row|
  venue_photos << row
end
user_photos = []
csv_text = File.read(Rails.root.join('lib','seeds','user_photos.csv'))
csv = CSV.parse(csv_text, encoding: 'UTF-8')
csv.each do |row|
  user_photos << row
end

x = 0
while x < user_photos.size - 20
  name = Faker::Name.name
  puts name
  user = User.new(
    is_owner: false,
    name: name,
    username: name.strip,
    email: Faker::Internet.email,
    password: Faker::Blockchain::Bitcoin.address,
  )
  file = URI.open(user_photos[x][0])
  user.photo.attach(io: file, content_type: "image/png", filename: "user#{user.id}.jpg")
  user.save!
  puts "User #{x} saved!"
  x += 1
end

x = 0
while x < 20
  name = Faker::Name.name
  user = User.new(
    is_owner: true,
    name: name,
    username: name.strip,
    email: Faker::Internet.email,
    password: Faker::Blockchain::Bitcoin.address,
  )
  file = URI.open(user_photos[x + 279][0])
  user.photo.attach(io: file, content_type: "image/png", filename: "user#{user.id}.jpg")
  user.save!
  puts "User #{x + 279} saved!"
  x += 1
end

x = 0
while x < 100
  venue = Venue.new(
    name: Faker::Coffee.blend_name,
    address: Faker::Address.full_address,
    website: Faker::Blockchain::Bitcoin.address,
    category: ["Bar", "Cafe", "Library", "Cafe", "Cafe", "Cafe", "Cafe", "Cafe", "Cafe", "Cafe", "Cafe"].sample,
    user_id: x,
    power_outlets: [true, false].sample,
    natural_light: [true, false].sample,
    suited_for_calls: [true, false].sample,
    opening_time: [6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9, 9.5, 10.0].sample,
    closing_time: [17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0, 20.5, 21.0, 21.5, 22.0, 22.5, 23.0, 23.5].sample
  )
  file = URI.open(venue_photos[x][0])
  venue.photo.attach(io: file, content_type: "image/png", filename: "venue_#{venue.id}.jpg")
  venue.save!
  puts "Venue #{x} saved!"
  x += 1
end

# OFFERS ?
x = 0
while x < 100
  Offer.create(
    venue_id: x,
    offer: [5.0, 10.0, 15.0, 20.0, 30.0].sample
  )
  x += 8
end

x = 0
while x < 300
  Review.create(
    calls: [true, true, true, true, true, true, true, false, false, false].sample,
    cafe_con_leche_price: rand(1.4..2.3),
    wifi: [rand(30..300), rand(30..150)],
    power_outlets: [true, true, true, true, true, true, true, false, false, false].sample,
    natural_light: [true, true, true, true, true, true, true, false, false, false].sample,
    timestamp: rand(ninety_day_ago..now),
    stars: rand(0..5),
    food_price: rand(0..5)
  )
  x += 1
end
