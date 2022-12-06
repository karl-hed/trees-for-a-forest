# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Booking.destroy_all
Event.destroy_all
Review.destroy_all
Organization.destroy_all
# Message.destroy_all
# Chat.destroy_all
User.destroy_all

achievement_levels = %i[beginner: 0 intermediate: 1 advanced: 2 super_planter: 3]

org_array = %w[onetreeplanted jour-de-la-terre espacepourlavie arbrescanada asfq
               mon-arbre-a-moi arbres-eco GRAME-Eco-quartier nature-action-quebec arbre-evolution]

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

seed_number = org_array.size

array_of_users = []

puts "Creating users"
seed_number.times do
  puts "email: #{Faker::Internet.email}"
  array_of_users << User.create(
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
end

index = 0

array_of_organizations = []

puts "Creating organizations"
org_array.each do |org|
  array_of_organizations << Organization.create(
    name: org,
    photo_url: logos[index]
  )
  index += 1
end

array_of_ids_from_organizations = []

Organization.all.each do |org|
  array_of_ids_from_organizations << org.id
end

index = 0

puts "Creating events"

array_of_events = []

I18n.locale = 'en-US'
seed_number.times do
  array_of_events << Event.create(
    name: Faker::FunnyName.name,
    description: Faker::Hipster.sentence,
    date: Faker::Date.in_date_period,
    time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
    # organization_id: Organization.find(id: array_of_ids_from_organizations[index]),
    organization_id: array_of_organizations[index].id,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    region: Faker::Address.state,
    capacity: [*0..100].sample
  )
  index += 1
end

index = 0
array_of_bookings = []

puts "Creating bookings"
seed_number.times do
  array_of_bookings << Booking.create(
    user_id: array_of_users[index].id,
    event_id: array_of_events[index].id
  )
  index += 1
end

index = 0

puts "Creating reviews"
seed_number.times do
  Review.create(
    content: Faker::Hipster.sentence,
    rating: [*0..5].sample,
    booking_id: array_of_bookings[index].id
  )
  index += 1
end

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
