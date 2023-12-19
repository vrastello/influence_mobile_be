# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    description { Faker::Lorem.paragraph }
    genre { Faker::Lorem.word }
    title { Faker::Lorem.word }
    payout { 10_000 }
  end
end