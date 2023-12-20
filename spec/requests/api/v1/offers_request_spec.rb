require 'rails_helper'

RSpec.describe "api/v1/offers", type: :request do
  describe "GET /api/v1/offers" do
    let!(:user) { create(:user) }
    let!(:offer) { create(:offer) }

    it "gets offers" do
      allow_any_instance_of(Api::ApplicationController).to receive(:find_user_with_token).and_return(user)
      allow(OfferQuery).to receive(:user_specific_offers).and_return([offer])
      get api_v1_offers_path

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["offers"][0]["description"]).to eq(offer.description)
    end
  end

    describe "GET /api/v1/admin_offers" do
    let!(:current_user) { create(:user, role: "admin") }
    let!(:offer) { create(:offer) }

    it "gets offers" do
      allow_any_instance_of(Api::V1::OffersController).to receive(:current_user).and_return(current_user)
      allow_any_instance_of(Api::ApplicationController).to receive(:find_user_with_token).and_return(current_user)
      allow(OfferQuery).to receive(:offer_specific_detail_by_age).and_return([offer])
      get api_v1_admin_offers_path

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["offers"][0]["description"]).to eq(offer.description)
    end
  end

  describe "GET /api/v1/offers" do
    let!(:current_user) { create(:user, role: "admin") }
    let!(:offer) { create(:offer) }
    let!(:params) { { id: offer.id } }

    it "gets offers" do
      allow_any_instance_of(Api::V1::OffersController).to receive(:current_user).and_return(current_user)
      allow_any_instance_of(Api::ApplicationController).to receive(:find_user_with_token).and_return(current_user)
      get api_v1_admin_offers_path, params: params

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["offers"][0]["description"]).to eq(offer.description)
    end
  end

  describe "PATCH /api/v1/log_play_hours" do
    let!(:current_user) { create(:user, role: "admin") }
    let!(:offer) { create(:offer) }
    let!(:params) { { offer: { offer_id: offer.id, play_hours: 10 } } }

    it "gets offers" do
      allow_any_instance_of(Api::V1::OffersController).to receive(:current_user).and_return(current_user)
      allow_any_instance_of(Api::ApplicationController).to receive(:find_user_with_token).and_return(current_user)
      allow_any_instance_of(LogPlayHoursService).to receive(:log).and_return(true)

      patch api_v1_log_play_hours_path, params: params

      expect(response).to have_http_status(:ok)
    end
  end
end
