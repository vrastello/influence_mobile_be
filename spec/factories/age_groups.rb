# frozen_string_literal: true

FactoryBot.define do
  factory :age_group do
    start_age { Faker::Number.between(from: 10, to: 25) }
    end_age { Faker::Number.between(from: 25, to: 60) }
    name { Faker::Lorem.word }
  end
end