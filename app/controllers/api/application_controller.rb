# frozen_string_literal: true

class Api::ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  private

  def authenticate_request
    find_user_with_token
  rescue Standard::Error => e
    # any error here means token is invalid
    render json: { error: e.message }, status: :unauthorized
  end

  def find_user_with_token
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
