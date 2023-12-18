# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

5.times do |i|
  offer = Offer.create!(description: Faker::Marketing.buzzwords, 
                        gender: Offer::GENDERS.sample([1, 2].sample),
                        genre: Faker::Game.genre,
                        title: Faker::Game.title,
                        payout: Faker::Number.between(from: 1000, to: 20_000))

  age_group = AgeGroup.create!(name: "group #{i}",
                               start_age: Faker::Number.between(from: 10, to: 30),
                               end_age: Faker::Number.between(from: 31, to: 50))

  offer.offer_details.create!(start_age: Faker::Number.between(from: 10, to: 30),
                              end_age: Faker::Number.between(from: 31, to: 50),
                              play_hours: Faker::Number.between(from: 1, to: 10),
                              age_group: age_group,
                              disabled: false)

  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               birthdate: Faker::Date.birthday(min_age: 10, max_age: 50),
               gender: Offer::GENDERS.sample,
               username: Faker::Internet.username,
               email: Faker::Internet.email,
               password: "password",
               role: User::USER)
end

User.create!(first_name: "Admin",
             last_name: "Admin",
             birthdate: Faker::Date.birthday(min_age: 10, max_age: 50),
             gender: Offer::GENDERS.sample,
             username: "admin",
             email: "admin@admin.com",
             password: "password",
             role: User::ADMIN)

puts User.all.pluck(:username)
