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

achievement_levels = %w[gold silver bronze]

org_array = %w[One\ Tree\ Planted Jour\ de\ la\ terre Espace\ pour\ la\ vie Arbres\ Canada asfq
               Mon\ arbre\ à\ moi Arbres-Éco GRAME-Éco-quartier Nature-Action-Québec Arbre-Évolution]

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

about_us_org = ["We are a national conservation organization working in the U.S.\
                  and Canada to advance the conservation of forests. We work \
                  together with brands and governments to restore native forests,\
                  promote and expand urban forests, and improve upon forest \
                  policy. In over 140 years of forest restoration projects, \
                  American Forests has successfully planted over 50 million \
                  trees across North America.",
                "We are a 501(3)(c) nonprofit on a mission to employ \
                 people through reforestation. Its projects \
                 involve working directly with people in villages in Canada to \
                 plant over 250 million trees and plan to continue to plant over \
                 100 million trees each year.",
                "We are a 501(c)(3) nonprofit based in Quebec that has a simple \
                 directive: one dollar = one tree. Founded in 2014 with a \
                 mission to make it easy for people to help the environment, \
                 One Tree Planted works together with reforestation \
                 organizations around the world to fund the planting of trees \
                 that help stabilize the climate, provide habitat for \
                 biodiversity, and create sustainable jobs.",
                "We are a NGO that was founded as a simple solution to global \
                 warming. The group works to empower communities and create \
                 sustainable, high standard, and scalable initiatives for \
                 reforestation. It believes that healthy forests are the best \
                 technology for removing carbon dioxide from the atmosphere and \
                 have built corporate and scientific partnerships to fund tree \
                 planting initiatives around the world.",
                "We are a 501(c)(3) nonprofit building alliances to create a \
                 better future for people and planet. They offer a \
                 certification program for brands selling rainforest-friendly \
                 products and work alongside activists, businesses, small \
                 farmers, and forest communities to drive positive social, \
                 environmental, and economic change across forest landscapes.",
                "We are a nonprofit working to protect the lands and waters on \
                 and in which all life depends. Founded in 1951, the \
                 organization collaborates with scientists, policymakers, \
                 farmers, communities, and others to help tackle climate change \
                 in a number of different ways. Some of their priorities \
                 include greening urban spaces, encouraging regenerative \
                 farming, and protecting clean waterways.",
                "We are an international organization dedicated to creating a \
                 green and peaceful world that is ecologically diverse and \
                 healthy. Founded in the 1970s, the nonprofit now has a \
                 presence in over 40 countries and relies on its membership of \
                 activists, students, educators, scientists, and \
                 environmentalists to investigate issues and solutions, lobby \
                 governments, and show up for actions against climate change.",
                "We are a nonprofit organization and group of scholars, \
                 scientists, entrepreneurs, and advocates around the globe \
                 who are collaborating to lay out a comprehensive plan to \
                 reverse global warming.",
                "We are a charity working with members to advocate for \
                 healthy, humane, and sustainable systems for food, farming, \
                 and land use. The group lobbies politicians, certifies \
                 sustainable products, and provides resources and education \
                 for both farmers and consumers in the food and fashion \
                 industries. Its current campaigns focus on regenerative \
                 farming, agroforestry, making healthy, sustainable forestry \
                 easier for everyone.",
                "We are a nonprofit organization and group of scholars, \
                 scientists, entrepreneurs, and advocates around the globe who \
                 are collaborating to lay out a comprehensive plan to reverse \
                 global warming. Conclusions from its analysis show that we \
                 already have the tools to tackle climate change. In light of \
                 this, today, the group now focuses on educating people around \
                 the world and supporting initiatives that implement the \
                 effective tools identified from its research."]

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

# avatar_imgs = %w[app/assets/images/avatar01.png app/assets/images/avatar02.png]
avatar_imgs = %w[app/assets/images/avatar1.jpg app/assets/images/avatar2.jpg app/assets/images/avatar3.jpg app/assets/images/avatar4.jpg app/assets/images/avatar5.jpg app/assets/images/avatar6.jpg]


event_photos = %w[
  https://images.unsplash.com/photo-1569880153113-76e33fc52d5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80
]

seed_number = org_array.size


array_of_users = []

puts "Creating user Anne Fleur"
user_anne_fleur = User.new(
  first_name: "Anne Fleur",
  last_name: "Bayiha",
  email: "annefleur@lewagon.com",
  password: "123456",
  bio: "Student at Le Wagon Montreal, passionate about web-developpment and nature. Constantly looking for ways to get involved and to give back to mother nature 🌿",
  address: "Montreal",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, avatar_imgs[[*0..avatar_imgs.size-1].sample]))
user_anne_fleur.photo.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
user_anne_fleur.save!

array_of_users << user_anne_fleur

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
  file = File.open(File.join(Rails.root, avatar_imgs[[*0..avatar_imgs.size-1].sample]))
  user.photo.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
  user.save!
  array_of_users << user
end

index = 0
array_of_organizations = []

puts "Creating #{org_array.size} organizations"
org_array.each do |org|
  array_of_organizations << Organization.create!(
    name: org,
    photo_url: logos[index],
    about_us: about_us_org[index]
  )
  index += 1
end

index = 0
array_of_events = []

puts "Creating #{seed_number} events"
I18n.locale = 'en-US'
seed_number.times do
  array_of_events << Event.create!(
    name: event_names[index],
    description: descriptions[index],
    date: Faker::Time.between_dates(from: Date.today - 10, to: Date.today + 5),
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

# Users








saffron_avatar = %w[app/assets/images/Saffron.cropped.jpg]
oro_avatar = %w[app/assets/images/Oro.cropped.jpg]
anthony_avatar = %w[app/assets/images/Anthony.cropped.jpg]
kenzo_avatar = %w[app/assets/images/Kenzo.cropped.jpg]
marc_andre_avatar = %w[app/assets/images/Marc_andre.cropped.jpg]
ai_avatar = %w[app/assets/images/Ai.cropped.jpg]
roxanne_avatar = %w[app/assets/images/Roxanne.cropped.jpg]
harmony_avatar = %w[app/assets/images/Harmony.cropped.jpg]
najib_avatar = %w[app/assets/images/Najib.cropped.jpg]

puts "creating users ✏️..."





puts "Creating user Saffron Baker"
saffron = User.new(
  first_name: "Saffron",
  last_name: "Baker",
  email: "saffron@gmail.com",
  password: "123456",
  bio: "Hi! I'm Saffron, and I'm an environmentalist. I love trees 🌲, travel ✈️, and all of the wonderful things that come along with being an environmentalist. ",
  address: "Montreal",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, saffron_avatar[0]))

saffron.photo.attach(io: file, filename: "Saffron.cropped.jpg", content_type: "image/jpg")
saffron.save!

array_of_users << saffron

# ORO

puts "Creating user Oro "
oro = User.new(
  first_name: "Oro",
  last_name: "Musa",
  email: "oro@gmail.com",
  password: "123456",
  bio: "Hello everyone 👋🏾! I am dental assistant who loves the outdoors. I want to meet people who share my values. Hit me up!",
  address: "Chambly",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: false
)
file = File.open(File.join(Rails.root, oro_avatar[0]))

oro.photo.attach(io: file, filename: "Oro.cropped.jpg", content_type: "image/jpg")
oro.save!

array_of_users << oro

# ANTHONY

puts "Creating user anthony "
anthony = User.new(
  first_name: "Anthony",
  last_name: "Lackey",
  email: "anthony@gmail.com",
  password: "123456",
  bio: "I believe in our ability to make a difference, and I want to be an active part of that change 🌍. I hope you'll join me!",
  address: "Quebec",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, anthony_avatar[0]))

anthony.photo.attach(io: file, filename: "Anthony.cropped.jpg", content_type: "image/jpg")
anthony.save!

array_of_users << anthony

# KENZO

puts "Creating user kenzo "
kenzo = User.new(
  first_name: "Kenzo",
  last_name: "Lackey",
  email: "kenzo@gmail.com",
  password: "123456",
  bio: "I'm Kenzo, a doctor who loves nature and hiking 🏔️. I believe that we can all do more to make the world a better place by planting trees and caring for animals 🐕 in need. ",
  address: "Saguenay",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: false
)
file = File.open(File.join(Rails.root, kenzo_avatar[0]))

kenzo.photo.attach(io: file, filename: "Kenzo.cropped.jpg", content_type: "image/jpg")
kenzo.save!

array_of_users << kenzo

# AI

puts "Creating user Ai "
ai = User.new(
  first_name: "Ai",
  last_name: "Zhang",
  email: "ai@gmail.com",
  password: "123456",
  bio: "Hey! I'm Ai, and I'm a teacher 🍎. I love to volunteer, and I'm committed to making the world a better place. Check out my progress. ",
  address: "Brossard",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, ai_avatar[0]))

ai.photo.attach(io: file, filename: "Ai.cropped.jpg", content_type: "image/jpg")
ai.save!

array_of_users << ai

# ROXANNE

puts "Creating user Roxanne "
roxanne = User.new(
  first_name: "Roxanne",
  last_name: "Davignon",
  email: "roxanne@gmail.com",
  password: "123456",
  bio: "Hola, I am Roxanne a veterinarian 🐕🐈 who loves helping animals in need.  Join me! Plant a tree and make a difference, too!",
  address: "Brossard",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: false
)
file = File.open(File.join(Rails.root, roxanne_avatar[0]))

roxanne.photo.attach(io: file, filename: "Roxanne.cropped.jpg", content_type: "image/jpg")
roxanne.save!

array_of_users << roxanne

# MARC-ANDRÉ

puts "Creating user Marc-André "
marc_andre = User.new(
  first_name: "Marc-André",
  last_name: "Dupuis",
  email: "marc_andre@gmail.com",
  password: "123456",
  bio: "Travel. Sail the world. Plant trees 🌲✈️⛵.",
  address: "Trois-Rivières",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: false
)
file = File.open(File.join(Rails.root, marc_andre_avatar[0]))

marc_andre.photo.attach(io: file, filename: "Marc_andre.cropped.jpg", content_type: "image/jpg")
marc_andre.save!

array_of_users << marc_andre

# Harmony

puts "Creating user harmony "
harmony = User.new(
  first_name: "Harmony",
  last_name: "Todd",
  email: "harmony@gmail.com",
  password: "123456",
  bio: "I love being outside, especially when it's nice out. I love to cook 💓👩🏻‍🍳, and I love to eat food that tastes like nature. My friends say I make the best vegan hummus, hit me up if you would like to taste.",
  address: "Montreal",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, harmony_avatar[0]))

harmony.photo.attach(io: file, filename: "Harmony.cropped.jpg", content_type: "image/jpg")
harmony.save!

array_of_users << harmony


# Najib

puts "Creating user Najib"
najib = User.new(
  first_name: "Najib",
  last_name: "Akhtar",
  email: "najib@gmail.com",
  password: "123456",
  bio: "I'm an software engineer 💻 who loves to help others. I volunteer in my spare time and am passionate about planting trees wherever I can.",
  address: "Sherbrook",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, najib_avatar[0]))

najib.photo.attach(io: file, filename: "Najib.cropped.jpg", content_type: "image/jpg")
najib.save!

array_of_users << najib
