# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfferSerializer do

  subject { described_class.new(offer).serializable_attributes }

  describe '#serializable_attributes' do
    let(:offer) { create(:offer, :with_offer_details) }

    it "includes the expected attributes" do
      expect(subject[:id]).to eq(offer.id)
      expect(subject[:title]).to eq(offer.title)
      expect(subject[:payout]).to eq(offer.formatted_payout)
    end

    it "returns serialized offer_detail" do
      offer_detail_hash = subject[:offer_details][0]
      offer_detail = offer.offer_details.first
      expect(offer_detail_hash[:id]).to eq(offer_detail.id)
      expect(offer_detail_hash[:start_age]).to eq(offer_detail.start_age)
      expect(offer_detail_hash[:end_age]).to eq(offer_detail.end_age)
      expect(offer_detail_hash[:play_hours]).to eq(offer_detail.play_hours)
      expect(offer_detail_hash[:age_group_id]).to eq(offer_detail.age_group_id)
      expect(offer_detail_hash[:gender]).to eq(offer_detail.formatted_gender)
    end
  end
end
