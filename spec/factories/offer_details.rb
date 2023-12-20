# frozen_string_literal: true

FactoryBot.define do
  factory :offer_detail do
    start_age { 10 }
    end_age { 20 }
    play_hours { Faker::Number.between(from: 1, to: 9000) }
    age_group { create(:age_group) }
    offer { create(:offer) }
    disabled { false }
  end
end