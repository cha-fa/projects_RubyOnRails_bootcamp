# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dogsitter.destroy_all
Dog.destroy_all
City.destroy_all
Stroll.destroy_all

10.times do
  City.create!(city_name: Faker::Address.city)
end

20.times do
  Dog.create(
    name:Faker::FunnyName.two_word_name,
    city:City.all.sample
    )
end

15.times do
  Dogsitter.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    city:City.all.sample 
    )
end

25.times do 
  Stroll.create(
    date:Faker::Time.between(from: DateTime.now, to: DateTime.now + 365, format: :long),
    dog: Dog.all.sample,
    dogsitter: Dogsitter.all.sample,
    city: City.all.sample
    )
end