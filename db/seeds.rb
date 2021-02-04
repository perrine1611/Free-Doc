# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all

15.times do
	city = City.create!(name: Faker::Address.city)
end

Specialty.create!(specialty: "Généraliste")
Specialty.create!(specialty: "Dermatologue")
Specialty.create!(specialty: "Dentiste")
Specialty.create!(specialty: "Kinésithérapeute")
Specialty.create!(specialty: "Ophtalmologue")

20.times do
	doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id, zip_code:Faker::Address.zip_code)
end

25.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
end

30.times do
   appointment = Appointment.create!(date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 100), city_id: City.all.sample.id, doctor: Doctor.all.sample, patient: Patient.all.sample)
end

# On attribue une ou plusieurs spécialités à chaque docteur
20.times do
  join = JoinTableDoctorSpecialty.create!(doctor: Doctor.all.select(:id).sample, specialty: Specialty.all.select(:id).sample)
end