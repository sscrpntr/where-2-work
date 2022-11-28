require 'faker'
Faker::Config.locale = 'ca-CAT'

now = Time.now
ninety_day_ago = now - (60 * 60 * 24 * 90)

100.times do
  Cafe.create(
    name: Faker::Coffee.blend_name,
    Faker::Address.full_address,
    website: Faker::Blockchain::Bitcoin.address,
    photo: ,
  )
end
# OFFERS ?
300.times do
  Review.create(
    calls: [true, true, true, true, true, true, true, false, false, false].sample,
    cafe_con_leche_price: rand(1.4..2.3),
    wifi: [rand(30..300), rand(30..150)],
    power_outlets: [true, true, true, true, true, true, true, false, false, false].sample,
    natural_light: [true, true, true, true, true, true, true, false, false, false].sample,
    timestamp: rand(ninety_day_ago..now),
    stars: rand(0..5),
    food_price: ["cheap", "normal", "expensive"].sample
  )
end
200.times do
  User.create(

  )
end
