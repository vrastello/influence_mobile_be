# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OfferDetailSerializer do

  subject { described_class.new(offer_detail).serializable_attributes }

  describe '#serializable_attributes' do
    let(:offer_detail) { create(:offer_detail) }

    it "includes the expected attributes" do
      expect(subject[:start_age]).to eq(offer_detail.start_age)
      expect(subject[:end_age]).to eq(offer_detail.end_age)
      expect(subject[:play_hours]).to eq(offer_detail.play_hours)
      expect(subject[:age_group_id]).to eq(offer_detail.age_group_id)
      expect(subject[:gender]).to eq(offer_detail.formatted_gender)
    end
  end
end
