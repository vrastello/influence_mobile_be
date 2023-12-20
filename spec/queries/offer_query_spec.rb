# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfferQuery do
  describe "#user_specific_offers" do
    let(:user) { create(:user, age: 15, birthdate: 15.years.ago, gender: "male") }
    let!(:correct_offer) { create(:offer, :with_offer_detail_less_age) }
    let!(:incorrect_offer) { create(:offer, :with_offer_detail_greater_age) }
    let!(:another_bad_offer) { create(:offer, :with_offer_detail_less_age_female_only) }

    it "filters out offers that are not for the user's age and gender" do
      expect(OfferQuery.user_specific_offers(user).count).to eq(1)
    end
  end

  describe "#offer_specific_detail_by_age" do
    let(:user) { create(:user, age: 15, birthdate: 15.years.ago, gender: "male") }
    let!(:offer) { create(:offer, :with_mixed_offer_detail) }

    it "filters out offer details by age and gender" do
      expect(OfferQuery.offer_specific_detail_by_age(user, offer).count).to eq(1)
    end
  end
end