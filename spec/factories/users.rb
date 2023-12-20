# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.first_name }
    birthdate { Faker::Date.birthday(min_age: 10, max_age: 50) }
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    gender { Offer::GENDERS.sample }
  end
end