require 'rails_helper'
 
RSpec.describe "api/v1/users", type: :request do
  describe "POST /api/v1/users" do
    it "creates a new user" do
      params = { user: attributes_for(:user) }

      expect do
        post api_v1_users_path, params: params
      end.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["email"]).to eq(params[:email])
    end
  end
end
