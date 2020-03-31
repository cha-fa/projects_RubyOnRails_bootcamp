# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
JoinSpecialtyDoctor.destroy_all

specialty_array = ["Ophtalmologue", "Généraliste", "Chirurgien", "Dentiste", "Cardiologue", "Dermatologue", "Rhumatologue", "Pédiatre"]

50.times do
  City.create!(city_name: Faker::Address.city)
end

specialty_array.each do |specialtyname|
  Specialty.create(specialty_name:specialtyname)
end

50.times do
  Doctor.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,  
    zip_code:Faker::Address.zip_code, 
    city: City.all.sample
    )
end

50.times do 
  Patient.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    city: City.all.sample
    )
end

50.times do
  Appointment.create!(
    date:Faker::Time.between(from: DateTime.now, to: DateTime.now + 365, format: :long),
    doctor: Doctor.all.sample,
    patient: Patient.all.sample,
    city: City.all.sample
    )
end

50.times do
  JoinSpecialtyDoctor.create(
    doctor:Doctor.all.sample,
    specialty: Specialty.all.sample
    )
end
