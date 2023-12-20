# frozen_string_literal: true

FactoryBot.define do
  factory :offer_detail do
    start_age { Faker::Number.between(from: 10, to: 25) }
    end_age { Faker::Number.between(from: 25, to: 60) }
    play_hours { Faker::Number.between(from: 1, to: 9000) }
    age_group { create(:age_group) }
    offer { create(:offer) }
  end
end