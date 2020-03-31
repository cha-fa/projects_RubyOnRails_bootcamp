# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
User.destroy_all
Cart.destroy_all
JoinItemCart.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

20.times do 
  Item.create!(
    title: Faker::FunnyName.two_word_name,
    description: Faker::Lorem.paragraph_by_chars(number: 149, supplemental: false),
    price_in_cents: rand(100..3000).to_i,
    image_url: Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'animals')
    )
  end



