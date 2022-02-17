require 'faker'

# Vider les tables à chaque nouveau seed via $ rails db:seed
City.destroy_all 
User.destroy_all 
Gossip.destroy_all
Tag.destroy_all 
Affiliation.destroy_all

# Table cities
5.times do |c|
  city = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

# Table users
100.times do |d|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    age: rand(18..100),
    city_id: City.ids.sample
  )
end

# FOCUS ON :
# ids method >>> https://stackoverflow.com/questions/17103003/rails-active-record-get-ids-array-from-relation
# sample method >>> https://www.geeksforgeeks.org/ruby-array-sample-function/#:~:text=Array%23sample()%20%3A%20sample(),random%20elements%20from%20the%20array.&text=Return%3A%20a%20random%20element%20or%20n%20random%20elements%20from%20the%20array.
# Autre possibilité : "city_id : City.all.sample" va automatiquement récupérer aléatoirement un id d'objet City car les models doctor et city sont liés !


# Table gossips
200.times do
  gossip = Gossip.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user_id: User.ids.sample
  )
end

# Table tags
10.times do
  tag = Tag.create!(title: Faker::Color.color_name)
end

# Table join_gossip_tags
100.times do
  rand_gossip_id = Gossip.find_by(id: rand(1..Gossip.all.length)) #tirage aléatoire d'un id de la table gossips parmi le nombre d'entrées de la table (en évitant l'id 0 qui n'existe pas...)
  rand_tag_id = Tag.find_by(id: rand(1..Tag.all.length)) #idem

  gossip_tag_join = Affiliation.create!(gossip: rand_gossip_id, tag: rand_tag_id)
end
