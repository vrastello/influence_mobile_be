require 'faker'

20.times do |i|
  AgeGroup.create!(name: "group #{i}",
                   start_age: Faker::Number.between(from: 10, to: 25),
                   end_age: Faker::Number.between(from: 25, to: 60))
                   puts "seeding age group....#{i}"
end

100.times do |i|
  offer = Offer.create!(description: Faker::Marketing.buzzwords, 
                        gender: Offer::GENDERS.sample([1, 2].sample),
                        genre: Faker::Game.genre,
                        title: Faker::Game.title,
                        payout: Faker::Number.between(from: 1000, to: 20_000))
                        puts "seeding offers....#{i}"

  group_ids = (1..10).to_a.sample 5 # 5 random and unique age groups/offer details for each offer
  group_ids.each do |id|
    offer.offer_details.create!(start_age: AgeGroup.find(id).start_age,
                                end_age: AgeGroup.find(id).end_age,
                                play_hours: Faker::Number.between(from: 1, to: 5000),
                                age_group_id: id,
                                disabled: false)
                                puts "seeding 5 offer details for offer #{i}....."
  end
end

20.times do |i|
  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               birthdate: Faker::Date.birthday(min_age: 10, max_age: 50),
               gender: Offer::GENDERS.sample,
               username: Faker::Internet.username + i.to_s,
               email: Faker::Internet.email,
               password: "password",
               role: User::USER)
               puts "seeding users....#{i}"
end

User.create!(first_name: "Admin",
             last_name: "Admin",
             birthdate: Faker::Date.birthday(min_age: 10, max_age: 50),
             gender: Offer::GENDERS.sample,
             username: "admin",
             email: "admin@admin.com",
             password: "password",
             role: User::ADMIN)
             puts "seeding admin...."

puts "\n all user_names:\n #{[User.all.pluck(:username)]}"
puts "\n admin username: 'admin', password: 'password'"
puts "\n all other users password: 'password'"
