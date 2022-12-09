# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts "Destroying Reviews in the database"
Review.destroy_all
puts "Destroying Bookings in the database"
Booking.destroy_all
puts "Destroying Events in the database"
Event.destroy_all
puts "Destroying Organizations in the database"
Organization.destroy_all
puts "Destroying Users in the database"
User.destroy_all
# Message.destroy_all
# Chat.destroy_all

achievement_levels = %w[0 1 2 3]

org_array = %w[onetreeplanted jour-de-la-terre espacepourlavie arbrescanada asfq
               mon-arbre-a-moi arbres-eco GRAME-Eco-quartier nature-action-quebec arbre-evolution]

event_names = %w[Save\ the\ Environment
                 Help\ plant\ a\ tree
                 Rock\ with\ the\ Environment
                 Tree\ Planting\ Quebec
                 Plant\ Trees
                 Tree\ Helpers
                 Forest\ Love
                 Government\ Forest\ Event
                 Tree\ Planting\ Event\ Quebec
                 Grow\ your\ Forest]

logos = %w[https://cdn.shopify.com/s/files/1/0326/7189/files/One_Tree_Planted-logo-round.png?v=1668781952
           https://jourdelaterre.org/images/JTC_logo_c_rgb_web.png
           https://m.espacepourlavie.ca/sites/espacepourlavie.ca/themes/eplv_mobile/images/logo-eplv.jpg
           https://arbrescanada.ca/wp-content/uploads/2017/11/TCLogos_Green-Fr-1025x475-green.png
           https://afsq.org/wp-content/uploads/2022/10/cropped-Favicon-AFSQ.png
           https://www.sentiercp.com/medias/iw/800x0/Logo_MFFP.png
           https://cdn.shopify.com/s/files/1/0148/5632/3158/files/arbres_eco_logo_type_1200x1200.png?v=1613736186
           https://grame.org/wp-content/uploads/2020/08/GRAME-logo.png
           https://media-exp1.licdn.com/dms/image/C4D0BAQG_rEz8GKwSAQ/company-logo_200_200/0/1646233804068?e=2147483647&v=beta&t=JYNaKIgJqn3urXppyrEy3tmfzg0noXYV0cSN2_hcYlE
           https://mouvement.arbre-evolution.org/images/logo_AE.png]

descriptions = ["Tree planting event near Sherbrooke for nature-lovers. Get to know nature-minded people around you and\
                 give your time to participate in an awesome event.",
                "Plant trees in Bois-de-Boulogne in Montreal with eco-friendly people. Meet new people with an \
                eco-friendly attitude and actively participate in an event that changes our future.",
                "Participate in tree planting event near the Capitale-Nationale with nature-lovers.",
                "Get involved in the biggest tree planting this year in Chicoutimi for environmentalists.",
                "Give your time to fight climate change by planting trees in the Gaspésie region.",
                "Join a tree planting event in Longueuil by giving your time and energy to help the environment.",
                "Spend time with nature-lovers by planting trees in Trois-Rivieres. Meet new people with an \
                eco-friendly attitude and actively participate in an event that changes our future.",
                "Volunteer to plant trees near Matane by joining other nature-minded people.",
                "Spend time planting trees near Granby with eco-responsable people. Get to know nature-minded people \
                around you and give your time to participate in an awesome event.",
                "Participate in an awesome event planting trees near Levis with eco-friendly people."]

reviews = ["Awesome organisation. I enjoyed planting trees in this week's (december 2022) event. Organizers were really \
            helpful.",
           "I loved participating in this tree planting event. I'd like to thank everyone involved.",
           "It was my first time participating in a tree planting event. I really enjoyed my time with this \
            organisation. I loved meeting new people and making new friends.",
           "It is the first time I participate with this organisation and I loved volunteering with them.",
           "Loved it.",
           "I came with several of my friends who were all experienced tree planters and we all had a really good time.",
           "It was a pleasure for me to plant trees with this organisation.",
           "I'd like to personnally thank all the organizers for this event.",
           "I was very fun and very intense.",
           "Thanks to everyone involved.",
           "Our group was fun and the organisation was really good.",
           "Generally it was a fun experience.",
           "I enjoyed my time wit this organisation.",
           "It was a surprisingly fun experience.",
           "It was a lot of work but overall satisfying.",
           "Thanks to all the organizers.",
           "It was very fun",
           "I learned a lot.",
           "I loved the vibe.",
           "I made friends and I enjoyed planting trees with this organization."]

places = %w[Sherbrooke Montreal Quebec\ city Chicoutimi Gaspe Longueuil Trois-Rivieres Matane Granby Levis]

latitudes = %w[45.404476 45.508888 46.829853 48.4280529 48.8301 45.537307 46.3432397 48.844516 45.400002 46.738227]

longitudes = %w[-71.888351 -73.561668 -71.254028 -71.0684923 -64.4818 -73.510734 -72.5432834 -67.530576 -72.733330 -71.246459]

avatar_imgs = %w[app/assets/images/avatar01.png app/assets/images/avatar02.png]

event_photos = %w[
  https://images.unsplash.com/photo-1569880153113-76e33fc52d5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80
]

seed_number = org_array.size

array_of_users = []

puts "Creating user Jim Bo"
user_jim = User.new(
  first_name: "Jim",
  last_name: "Bo",
  email: "lewagon@lewagon.com",
  password: "password",
  bio: "Student at Le Wagon Montreal",
  address: "Montreal",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, avatar_imgs[[*0..1].sample]))

user_jim.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
user_jim.save!

array_of_users << user_jim

puts "Creating user Harmony"
user_harmony = User.new(
  first_name: "Anne Fleur",
  last_name: "Hagbang Bayiha",
  email: "anne_fleur@lewagon.com",
  password: "123456",
  bio: "Student at Le Wagon Montreal",
  address: "Montreal",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, avatar_imgs[[*0..1].sample]))
user_harmony.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
user_harmony.save!

array_of_users << user_harmony

puts "Creating #{seed_number - array_of_users.size} other users"
(seed_number - array_of_users.size).times do
  # puts "email: #{Faker::Internet.email}"
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    bio: Faker::Lorem.sentence,
    address: Faker::Address.full_address,
    achievement_level: achievement_levels.sample,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    wants_to_carpool: [true, false].sample
  )
  file = File.open(File.join(Rails.root, avatar_imgs[[*0..1].sample]))
  user.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
  user.save!
  array_of_users << user
end

index = 0
array_of_organizations = []

puts "Creating #{org_array.size} organizations"
org_array.each do |org|
  array_of_organizations << Organization.create!(
    name: org,
    photo_url: logos[index]
  )
  index += 1
end

index = 0
array_of_events = []

puts "Creating #{seed_number} events"
I18n.locale = 'en-US'
seed_number.times do
  array_of_events << Event.create!(
    # name: Faker::FunnyName.name,
    name: event_names[index],
    description: descriptions[index],
    date: Faker::Date.in_date_period,
    time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
    organization_id: array_of_organizations[index].id,
    latitude: latitudes[index],
    longitude: longitudes[index],
    region: places[index],
    capacity: [*70..100].sample
  )
  index += 1
end

index = 0
array_of_bookings = []

puts "Creating #{seed_number} bookings"
seed_number.times do
  array_of_bookings << Booking.create!(
    user_id: array_of_users[index].id,
    event_id: array_of_events[index].id
  )
  index += 1
end

index = 0
puts "Creating #{seed_number} bookings"
seed_number.times do
  array_of_bookings << Booking.create!(
    user_id: array_of_users[-index].id,
    event_id: array_of_events[index].id
  )
  index += 1
end

index = 0
review_index = 0

puts "Creating #{reviews.size} reviews"

# Review.create!(content: reviews[0], rating: [*3..5].sample, booking_id: array_of_bookings[0].id)
# Review.create!(content: reviews[1], rating: [*3..5].sample, booking_id: array_of_bookings[1].id)
# Review.create!(content: reviews[2], rating: [*3..5].sample, booking_id: array_of_bookings[2].id)
# Review.create!(content: reviews[3], rating: [*3..5].sample, booking_id: array_of_bookings[3].id)
# Review.create!(content: reviews[4], rating: [*3..5].sample, booking_id: array_of_bookings[4].id)
# Review.create!(content: reviews[5], rating: [*3..5].sample, booking_id: array_of_bookings[5].id)
# Review.create!(content: reviews[6], rating: [*3..5].sample, booking_id: array_of_bookings[6].id)
# Review.create!(content: reviews[7], rating: [*3..5].sample, booking_id: array_of_bookings[7].id)
# Review.create!(content: reviews[8], rating: [*3..5].sample, booking_id: array_of_bookings[8].id)
# Review.create!(content: reviews[9], rating: [*3..5].sample, booking_id: array_of_bookings[9].id)
# Review.create!(content: reviews[10], rating: [*3..5].sample, booking_id: array_of_bookings[5].id)
# Review.create!(content: reviews[11], rating: [*3..5].sample, booking_id: array_of_bookings[4].id)
# Review.create!(content: reviews[12], rating: [*3..5].sample, booking_id: array_of_bookings[7].id)
# Review.create!(content: reviews[13], rating: [*3..5].sample, booking_id: array_of_bookings[8].id)
# Review.create!(content: reviews[14], rating: [*3..5].sample, booking_id: array_of_bookings[9].id)
# Review.create!(content: reviews[15], rating: [*3..5].sample, booking_id: array_of_bookings[1].id)
# Review.create!(content: reviews[16], rating: [*3..5].sample, booking_id: array_of_bookings[6].id)
# Review.create!(content: reviews[17], rating: [*3..5].sample, booking_id: array_of_bookings[3].id)
# Review.create!(content: reviews[18], rating: [*3..5].sample, booking_id: array_of_bookings[0].id)
# Review.create!(content: reviews[19], rating: [*3..5].sample, booking_id: array_of_bookings[2].id)

review_index = 0

array_of_organizations.each do |org|
  org_bookings = array_of_bookings.select { |booking| booking.organization.id == org.id }
  org_bookings.each do |org_booking|
    Review.create!(
      content: reviews[review_index],
      rating: [*3..5].sample,
      booking_id: org_booking.id
    )
    review_index += 1
  end
end

# review_index = 0

# reviews.size.times do
#   # index = (array_of_bookings.size / 2) - 1 if index > seed_number - 1
#   Review.create!(
#     content: reviews[review_index],
#     rating: [*3..5].sample,
#     booking_id: array_of_bookings[index > seed_number - 1 ? [*1..9].sample : index].id
#   )
#   index += 1
#   review_index += 1
# end

# array_of_chats = []

# puts "Creating chats"
# seed_number.times do
#   array_of_chats << Chat.create(
#     name: Faker::ProgrammingLanguage.name
#   )
# end

# index = 0

# puts "Creating messages"
# seed_number.times do
#   Message.create(
#     content: Faker::Hipster.sentence,
#     chat_id: array_of_chats[index].id,
#     user_id: array_of_users[index].id
#   )
#   index += 1
# end
