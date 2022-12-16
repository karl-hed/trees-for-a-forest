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

logos = %w[org1.cropped.jpg
          org2.cropped.jpg
          org3.cropped.jpg
          org4.cropped.jpg
          org5.cropped.jpg
          org6.cropped.jpg
          org7.cropped.jpg
          org5.cropped.jpg
          org6.cropped.jpg
          org7.cropped.jpg]

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

places = %w[Sherbrooke Montreal Quebec\ city Chicoutimi Gaspe Longueuil Trois-Rivieres Matane Granby Trois-Pistoles]

latitudes = %w[45.404476 45.508888 46.829853 48.4280529 48.8301 45.537307 46.3432397 48.844516 45.400002 48.119999]

longitudes = %w[-71.888351 -73.561668 -71.254028 -71.0684923 -64.4818 -73.510734 -72.5432834 -67.530576 -72.733330 -69.180000]

# avatar_imgs = %w[app/assets/images/avatar01.png app/assets/images/avatar02.png]
avatar_imgs = %w[app/assets/images/avatar1.jpg app/assets/images/avatar2.jpg app/assets/images/avatar3.jpg app/assets/images/avatar4.jpg app/assets/images/avatar5.jpg app/assets/images/avatar6.jpg]


event_photos = %w[
  https://images.unsplash.com/photo-1569880153113-76e33fc52d5f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80
]

seed_number = org_array.size

array_of_users = []

# USERS ---------------------------------

saffron_avatar = %w[app/assets/images/Saffron.cropped.jpg]
anne_fleur_avatar = "app/assets/images/annefleur.cropped.png"
oro_avatar = %w[app/assets/images/Oro.cropped.jpg]
anthony_avatar = %w[app/assets/images/Anthony.cropped.jpg]
kenzo_avatar = %w[app/assets/images/Kenzo.cropped.jpg]
marc_andre_avatar = %w[app/assets/images/Marc_andre.cropped.jpg]
ai_avatar = %w[app/assets/images/Ai.cropped.jpg]
roxanne_avatar = %w[app/assets/images/Roxanne.cropped.jpg]
harmony_avatar = %w[app/assets/images/Harmony.cropped.jpg]
najib_avatar = %w[app/assets/images/Najib.cropped.jpg]

puts "creating users ✏️..."


# ANNEFLEUR

puts "Creating user Anne Fleur"
anne_fleur = User.create!(
  first_name: "Anne Fleur",
  last_name: "Bayiha",
  email: "annefleur@lewagon.com",
  password: "123456",
  bio: "Hello there. I am Student at Le Wagon Montreal and I am passionate about web-developpment and nature 💻🌿. I am constantly looking for fun ways to give back and get involved to contribute to the environnement.",
  address: "Montreal",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, anne_fleur_avatar))

anne_fleur.photo.attach(io: file, filename: "annefleur.cropped.png", content_type: "image/png")
# anne_fleur.photo.attach(io: file, filename: "logo_org1.png", content_type: "image/png")
# anne_fleur.photo.attach(io: URI.open('https://api.lorem.space/image/face'), filename: "logo_org1.png", content_type: "image/png")
anne_fleur.save!

array_of_users << anne_fleur


# Karl

puts "Creating user Karl"
karl = User.new(
  first_name: "Karl",
  last_name: "Hedayati",
  email: "karl@lewagon.com",
  password: "123456",
  bio: "Hello there. I am Student at Le Wagon Montreal and I am passionate about programming and nature 💻🌿. I am constantly looking for fun ways to give back and get involved to contribute to the environnement.",
  address: "Montreal",
  latitude: 45.508888,
  longitude: -73.561668,
  wants_to_carpool: true
)
file = File.open(File.join(Rails.root, avatar_imgs[2]))

karl.photo.attach(io: file, filename: "avatar3.jpg", content_type: "image/png")
karl.save!

array_of_users << karl

# SAFFRON

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
  wants_to_carpool: true,
  achievement_level: "gold"
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

puts "SIZE ARRAY OF USERS: #{array_of_users.count}"

# END USERS -----------------------------





# puts "Creating #{seed_number - array_of_users.size} other users"
# (seed_number - array_of_users.size).times do
#   # puts "email: #{Faker::Internet.email}"
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: '123456',
#     bio: Faker::Lorem.sentence,
#     address: Faker::Address.full_address,
#     achievement_level: achievement_levels.sample,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude,
#     wants_to_carpool: [true, false].sample
#   )
#   file = File.open(File.join(Rails.root, avatar_imgs[[*0..avatar_imgs.size-1].sample]))
#   user.photo.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
#   user.save!
#   array_of_users << user
# end

# index = 0
# array_of_organizations = []

# puts "Creating #{org_array.size} organizations"
# org_array.each do |org|
#   array_of_organizations << Organization.create!(
#     name: org,
#     photo_url: logos[index],
#     about_us: about_us_org[index]
#   )
#   index += 1
# end



# ORGANISATIONS (10)

#ARBRE.ECO
array_of_organizations = []

puts "Creating arbres.eco organization"
arbres_eco = Organization.create!(
 name: "Arbres.eco",
 photo_url:"logo_org1.png",
 about_us:"Planting trees is a highly meaningful gesture. By acting on tree cover, we capture greenhouse gases and also improve the environment, health and quality of life for residents, while offering an economically viable response to climate change. We are currently witnessing an international movement aimed at increasing the canopy of cities and countryside. Give a hand so that together we can make a difference!
 Our partners are responsible companies, towns and villages concerned about their environment and also, for-profit organizations involved in their community."
)
array_of_organizations << arbres_eco

#GRAME
puts "Creating grame organization"
grame = Organization.create!(
 name: "GRAME",
 photo_url:"logo_org2.png",
 about_us:"As climate change becomes humanity's biggest challenge, and 75% of humans live in urban areas, GRAME is convinced that it is possible to build resilient communities that live in healthy and sustainable environments. This is her raison d'être, which she carries with assumed optimism. GRAME takes note of the fact that climate change amplifies social inequalities, and that the most vulnerable populations are the most affected, and often the first, by climate change; it takes this into account in its decisions and contributes to greater environmental justice.
 GRAME acts for a better environment in collaboration with citizens, communities and organizations as well as with governments, by intervening in the field, by deploying education and awareness programs and by issuing recommendations rooted in rigor. science that has characterized it since its creation. Find out how our actions embody our mission year after year!
 "
)
array_of_organizations << grame

#ONE TREE PLANTED
puts "Creating one tree planted organization"
one_tree_planted = Organization.create!(
 name: "One Tree Planted",
 photo_url:"logo_org3.png",
 about_us:"We want to make it simple for anyone to help the environment by planting trees. Together we can restore forests, create habitat for biodiversity, and make a positive social impact around the world. We plant one tree with every dollar donated. Since 2014, we have more than doubled the number of trees planted each year, and are working with partners across 47+ countries in North America, Latin America, Africa, Asia, Europe and the Pacific. We have planted over 40 million trees in more than 47 countries across the globe since 2014. In 2021, we more than doubled our impact from 2020 - with 23.5 million trees! Since our establishment, we have been dedicated to making it easier for both individuals and businesses to give back to the environment, create a healthier climate, protect biodiversity, and help reforestation efforts. With your support, we aid in environmental conservation and restoration across the globe!"

)
array_of_organizations << one_tree_planted

#JOUR DE LA TERRE
puts "Creating Jour de la terre organization"
jour_de_la_terre = Organization.create!(
 name: "Jour de la Terre",
 photo_url:"logo_org4.png",
 about_us:"Our mission: To help people and organizations reduce their impact on the environment. Earth Day was first celebrated on April 22, 1970. Today, more than one billion people in 193 countries take action each year for Earth Day. Over the years, Earth Day has become the largest participatory environmental movement on the planet.
 In 1990, the creation of the association in France and Canada goes hand in hand with the internationalization of the Earth Day movement. The Jour de la Terre France association has distinguished itself by organizing environmental campaigns and rallies, one of which, on April 22, 1990, remains to this day the largest French event dedicated to the environment with millions participants and nearly a thousand actions in all areas of the environment. In Quebec, Earth Day has been celebrated since 1995 by organizing all kinds of activities to raise awareness of environmental issues. With its ability to mobilize community players, the provincial organization has continued to grow, developing numerous action programs on April 22 and every day.
 In 2015, French and Quebec teams joined forces to breathe new life into the Earth Day movement in France, Quebec and the rest of the Francophonie. In 2019, a strategic alliance was concluded with EarthPLAY in Canada, so that the environmental support programs carried out in Quebec can be heard everywhere on Canadian territory. The association Jour de la Terre Canada is the holder of the trademark of the Earth Day in France and Canada"
)
array_of_organizations << jour_de_la_terre

#ESPACE POUR LA VIE
puts "Creating Espace pour la vie organization"
espace_pour_la_vie = Organization.create!(
 name: "Espace pour la vie",
 photo_url:"logo_org5.jpg",
 about_us:"Espace pour la vie's mission is to raise awareness of nature and the knowledge associated with it, to contribute to the study and preservation of biodiversity and to promote responsible behavior towards the environment. It contributes to the achievement of this mission in the respective spheres of each of the institutions (Biodôme: ecology and environmental sciences; Insectarium: entomology; Botanical Garden: botany and horticulture; Rio Tinto Alcan Planetarium: astronomy).
 Space for Life receives a large number of donation requests and wishes, while respecting its mission, to support the community and recognized organizations. Individual requests are not considered. Espace pour la vie's mission is to raise awareness of nature and the knowledge associated with it, to contribute to the study and preservation of biodiversity and to promote responsible behavior towards the environment.
 Our donation policy does not provide for monetary contributions or donations of promotional items, plants, etc. Priority will be given to activities and events held by non-profit organizations whose mission echoes the values and objectives of Space for Life. Only successful applications will receive a response."

)
array_of_organizations << espace_pour_la_vie

#ARBRE CANADA
puts "Creating Arbres Canada organization"
arbres_canada = Organization.create!(
 name: "Arbres Canada",
 photo_url:"logo_org6.webp",
 about_us:"Tree Canada is the only national not-for-profit organization that plants and nurtures trees in rural and urban settings, in every province across the country. We help increase Canada's forest cover through our programs, research, advocacy, and by providing grants to communities and schools. We are thought leaders and help build capacity by collaborating with a network of industry experts, academics and other nonprofits to build community knowledge and help municipalities plan and support local forest cover.With our partners and sponsors, we have planted over 84 million trees. Improving the lives of Canadians by planting and caring for trees while teaching the value of trees. To inspire, inform and empower Canadians to plant and nurture trees to improve quality of life and fight climate change."

)
array_of_organizations << arbres_canada

#ASFQ
puts "Creating ASFQ organization"
asfq = Organization.create!(
 name: "ASFQ",
 photo_url:"log_org7.webp",
 about_us:"Far from being a luxury, architecture is essential to human flourishing, sustainable development and the autonomy of communities. It involves rights as fundamental as housing, health, education, equality and security. These depend on adequate infrastructure, which requires quality architecture. Yet, due to hazards and injustices, the majority of the planet's inhabitants live in deficient built environments, and do not benefit from the capacities required to develop safe, healthy and ecological living environments. This situation persists all the more as urbanization, migration and climate change are accelerating, further deteriorating the habitat of vulnerable people. This is why solidarity, quality and borderless architecture is more necessary than ever to find the best solutions to the challenges facing humanity."

)
array_of_organizations << asfq

#MON ARBRE A MOI
puts "Creating Mon Arbre a moi organization"
mon_arbre_a_moi = Organization.create!(
 name: "Mon arbre à moi",
 photo_url:"logo_org8.png",
 about_us:"The government of Quebec is launching The My Tree of Mine campaign allows any child born or adopted in Quebec in the current year to receive a small tree seedling that will grow with them. Little plant will grow...The young plants given by the Department during Tree and Forest Month are on average 2 years old and 30 to 60 centimeters high, depending on the species. The trees offered are native forest species of Quebec with a good longevity, more than 100 years. These trees will grow to reach 20 to 25 meters in height, some as young as 30 years old."

)
array_of_organizations << mon_arbre_a_moi

#NATURE ACTION QUEBEC
puts "Creating Nature Action Quebec organization"
nature_action_quebec = Organization.create!(
 name: "Nature action Quebec",
 photo_url:"logo_org9.png",
 about_us:"Nature-Action Québec is a non-profit organization, recognized conservation organization, charity and social economy enterprise that works to protect the environment. Born from a citizen initiative in Saint-Bruno-de-Montarville, NAQ has slowly but surely evolved into its current form: a large-scale social economy enterprise that shapes and executes transition projects in more than 100 communities. with 350 projects annually.
 Its success is based on the strength of its team, made up of more than 100 professionals dedicated to protecting the environment. Experts, managers and technicians who have enviable skills in various sectors of activity and who have chosen to work within an organization whose values and commitment they share.
 Nature-Action Québec has given itself the mission of guiding individuals and organizations in the application of best environmental practices. Thus, it contributes to the realization of many innovative projects in several areas that affect the environment, in partnership with municipalities, non-profit organizations, citizens, government departments and private companies.
 Faced with the climate emergency that is shaking our planet, we now realize that it is time to act for the good of the communities of today and tomorrow. For more than 35 years, NAQ has worked to make things happen with you. Whether through the conservation of natural environments in perpetuity, the environmental restoration of degraded environments, awareness, territorial planning, sustainable development, management of environmental projects, programs and municipal infrastructures, education or communication , Nature-Action Québec puts its expertise at the service of nature and makes a difference in the environment.
 "

)
array_of_organizations << nature_action_quebec

# ARBRE EVOLUTION
puts "Creating Arbre évolution organization"
arbre_evolution = Organization.create!(
 name: "Arbre évolution",
 photo_url:"logo_org10.png",
 about_us:"Arbre-Évolution is a solidarity cooperative that promotes the well-being of communities through a symbiosis between the forest, humans and their environment. We have solid expertise in tree planting, ecosystem restoration, edible landscaping, carbon technologies and knowledge transfer. We offer personalized services to carry out decisive projects in your living environments. Our primary aims are community involvement and environmental awareness among young people. We are also the instigators of the Social Reforestation Program™, a unique tool available to communities to fund greening initiatives.
 Arbre-Évolution considers the forest as a natural environment, but also a human one. On the lookout for the major international challenges of sustainable development, the vision we propose seeks to act on the links between nature and cultural dynamics, on the synergies between communities and their environment. With this identity, we do not perceive the environment as an hermetic concept, but rather as a large whole in which social activity and ecology are in constant interaction. A forest is a living environment that evolves, Tree-Evolution tries to reflect it."
)
array_of_organizations << arbre_evolution

##END OF ORGANIZATION

puts "SIZE ARRAY OF ORGANISATION: #{array_of_organizations.count}"

index = 0
array_of_events = []

array_of_dates = [Date.today - 10, Date.today - 9, Date.today - 8, Date.today - 7, Date.today - 6,
                  Date.today + 1, Date.today + 2, Date.today + 3, Date.today + 4, Date.today + 5]

puts "Creating #{seed_number} events"
I18n.locale = 'en-US'
seed_number.times do
  array_of_events << Event.create!(
    name: event_names[index],
    description: descriptions[index],
    # date: Faker::Time.between_dates(from: Date.today - 10, to: Date.today + 5),
    date: array_of_dates[index],
    time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
    organization_id: array_of_organizations[index].id,
    latitude: latitudes[index],
    longitude: longitudes[index],
    region: places[index],
    capacity: [*70..100].sample,
    logo: logos[index]
  )
  puts "EVENT ##{index}: \nname: #{array_of_events[index].name}\ndate:#{array_of_events[index].date}"
  index += 1
end

# Event for the demo
# array_of_events << Event.create!(
#   name: "SPECIAL EVENT",
#   description: descriptions[index],
#   date: Date.today + 5,
#   time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
#   organization_id: array_of_organizations[index].id,
#   latitude: latitudes[index],
#   longitude: longitudes[index],
#   region: places[index],
#   capacity: [*70..100].sample,
#   logo: logos[index]
# )

# # Event for the Review
# array_of_events << Event.create!(
#   name: "EVENT FOR WHICH WE WRITE A REVIEW",
#   description: descriptions[index],
#   date: Date.today - 10,
#   time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
#   organization_id: array_of_organizations[index].id,
#   latitude: latitudes[index],
#   longitude: longitudes[index],
#   region: places[index],
#   capacity: [*70..100].sample,
#   logo: logos[index]
# )

puts "SIZE ARRAY OF EVENTS: #{array_of_events.count}"

index = 0
array_of_bookings = []

user_anne_fleur_id = User.find_by(first_name: "Anne Fleur").id
user_anne_fleur = User.find_by(first_name: "Anne Fleur")
user_karl_id = User.find_by(email: "karl@lewagon.com").id
user_karl = User.find_by(email: "karl@lewagon.com")

# Anne Fleur is booked for the 3 first events
puts "Anne Fleur is booked for the 3 first events"
3.times do
  array_of_bookings << Booking.create!(
    user_id: user_anne_fleur_id,
    event_id: array_of_events[index].id
  )
  puts "USER: #{user_anne_fleur.first_name}\nEVENT: #{array_of_events[index].name}"
  index += 1
end

# Anne Fleur is booked for the 2 last events
# puts "Anne Fleur is booked for the 2 last events"
# index = array_of_events.size - 1
# 2.times do
#   array_of_bookings << Booking.create!(
#     user_id: user_anne_fleur_id,
#     event_id: array_of_events[index].id
#   )
#   puts "USER: #{user_anne_fleur.first_name}\nEVENT: #{array_of_events[index].name}"
#   index -= 1
# end

index = 0

# array_of_events and array_of_users need to be the same size
puts "Creating #{seed_number} bookings"
seed_number.times do
  if array_of_users[index].id != user_anne_fleur_id && array_of_users[index].id != user_karl_id
    array_of_bookings << Booking.create!(
      user_id: array_of_users[index].id,
      event_id: array_of_events[index].id
    )
  end
  index += 1
end

index = 0

# organization = Event.find_by(name: "Forest Love").organization


puts "Book 4 users for the Forest Love event"

event_forest_love = Event.find_by(name: "Forest Love")
# user_harmony = User.find_by(first_name: "Harmony")

past_events = Event.where("date < :date", date: Date.today)

past_events.each do |past_event|
  array_of_bookings << Booking.create!(
    user: harmony,
    event: past_event
  )
end

# 4.times do
#   if array_of_users[index].id != user_anne_fleur_id && array_of_users[index].id != user_karl_id
#     # if !Booking.include?(array_of_users[index].id)
#     if !Booking.find_by(user: array_of_users[index])
#       array_of_bookings << Booking.create!(
#         user_id: array_of_users[index].id,
#         event_id: event_forest_love.id
#       )
#     end
#   end
#   index += 1
# end


index = 0
# puts "Creating #{seed_number} bookings"
# seed_number.times do
#   array_of_bookings << Booking.create!(
#     user_id: array_of_users[-index].id,
#     event_id: array_of_events[index].id
#   )
#   index += 1
# end

index = 0
# puts "Creating 1 more bookings"
# seed_number.times do
  # array_of_bookings << Booking.create!(
  #   user_id: User.find_by(first_name: "Karl").id,
  #   event_id: Event.find_by(name: "EVENT FOR WHICH WE WRITE A REVIEW").id
  # )
  # index += 1
# end

# array_of_bookings << Booking.create!(
#   user_id: array_of_users[0].id,
#   event_id: array_of_events[0].id
# )

index = 0

# 5.times do
#   if Booking.find_by(user: User.find_by(first_name: "Anne Fleur").id).nil?
#     array_of_bookings << Booking.create!(
#       user_id: User.find_by(first_name: "Anne Fleur").id,
#       event_id: array_of_events[index].id
#     )
#   end
#   index += 1
# end

# array_of_bookings << Booking.create!(
#   user_id: User.find_by(first_name: "Anne Fleur").id,
#   event_id: array_of_events[2].id
# )

# array_of_bookings << Booking.create!(
#   user_id: User.find_by(first_name: "Anne Fleur").id,
#   event_id: array_of_events[3].id
# )


puts "SIZE ARRAY OF BOOKINGS: #{array_of_bookings.count}"

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


# Review.create!(
  #   content: reviews[review_index],
  #   rating: [*3..5].sample,
  #   booking_id: org_booking.id
  # )


save_the_environment = array_of_events.find { |event| event.name == "Save the Environment" }
forest_love = array_of_events.find { |event| event.name == "Forest Love" }
# save_the_environment_bookings = array_of_bookings.select { |booking| booking.event_id == save_the_environment.id }

reviews_slugs = [
  {
    event: save_the_environment,
    users: [
      {
        user: karl,
        review: {
          content: "This was amazing experience",
          rating: 5
        }
      },
      {
        user: saffron,
        review: {
          content: "Thank you to everyone. I've met some awesome people.",
          rating: 4
        }
      },
      {
        user: oro,
        review: {
          content: "It was a great experience. Thank you to all who participated.",
          rating: 5
        }
      },
      {
        user: anthony,
        review: {
          content: "Great experience. I will participate again.",
          rating: 5
        }
      },
      {
        user: harmony,
        review: {
          content: "It was really fun. Thank you to all.",
          rating: 4
        }
      }
    ]
  },
  {
    event: forest_love,
    users: [
      {
        user: karl,
        review: {
          content: "This was amazing. I will book again.",
          rating: 5
        }
      },
      {
        user: saffron,
        review: {
          content: "I came with several of my friends who were all experienced tree planters and we all had a really good time.",
          rating: 4
        }
      },
      {
        user: oro,
        review: {
          content: "I found my experience to be very good.",
          rating: 5
        }
      },
      {
        user: anthony,
        review: {
          content: "Thank you to all the organizaers. It was really fun and amazing.",
          rating: 5
        }
      },
      {
        user: harmony,
        review: {
          content: "Thank you to everyone who participated.",
          rating: 4
        }
      }
    ]
  }
]

reviews_slugs.each do |reviews_slug|
  reviews_slug[:users].each do |user_slug|
    booking = Booking
              .find_by(user: user_slug[:user], event: reviews_slug[:event]) || Booking.create!(
                                                                                    user: user_slug[:user],
                                                                                    event: reviews_slug[:event]
                                                                                  )

    Review.create!(
      content: user_slug[:review][:content],
      rating: user_slug[:review][:rating],
      booking: booking
    )
  end
end

array_of_organizations.reject { |organization| organization == arbres_eco || organization == asfq }.each do |org|
  org_bookings = array_of_bookings.select { |booking| booking.organization.id == org.id }
  puts "SIZE BOOKING: #{org_bookings.size}"
  if org_bookings.size > 0
    org_bookings.each do |org_booking|
      if org_booking.user_id != user_anne_fleur_id && org_booking.user_id != user_karl_id
        Review.create!(
          content: reviews[review_index],
          rating: [*3..5].sample,
          booking_id: org_booking.id
        )
      end
      review_index += 1
    end
  end
end
