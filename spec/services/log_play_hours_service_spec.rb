# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LogPlayHoursService do
  describe "log" do
    let(:params) { { offer_id: offer.id, play_hours: 10 } }
    let(:user) { create(:user, age: 20) }
    let(:offer) { create(:offer, :with_offer_details) }
    subject { described_class.new(params: params, user: user) }


    it "adds play hours to all relevant offer details" do
      allow(OfferQuery).to receive(:offer_specific_detail_by_age).and_return(offer.offer_details)
      subject.log

      offer.offer_details.reload
      expect(offer.offer_details.first.play_hours).to eq(20)
    end
  end
end