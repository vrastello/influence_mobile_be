# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    description { Faker::Lorem.paragraph }
    genre { Faker::Lorem.word }
    title { Faker::Lorem.word }
    payout { 10_000 }
  end

  trait :with_offer_details do
    after(:create) do |offer|
      create(:offer_detail, offer: offer, play_hours: 10)
    end
  end

  trait :with_offer_detail_greater_age do
    after(:create) do |offer|
      create(:offer_detail, offer: offer, age_group: create(:age_group, start_age: 30, end_age: 31))
    end
  end

  trait :with_offer_detail_less_age do
    after(:create) do |offer|
      create(:offer_detail, offer: offer, age_group: create(:age_group, start_age: 10, end_age: 20))
    end
  end

  trait :with_offer_detail_less_age_female_only do
    after(:create) do |offer|
      create(:offer_detail, offer: offer, age_group: create(:age_group, start_age: 10, end_age: 20), gender: %w[female])
    end
  end

  trait :with_mixed_offer_detail do
    after(:create) do |offer|
      create(:offer_detail, offer: offer, age_group: create(:age_group, start_age: 30, end_age: 31))
      create(:offer_detail, offer: offer, age_group: create(:age_group, start_age: 10, end_age: 20))
      create(:offer_detail, offer: offer, age_group: create(:age_group, start_age: 10, end_age: 20), gender: %w[female])
    end
  end
end
