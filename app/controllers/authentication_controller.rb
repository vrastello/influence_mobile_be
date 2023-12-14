# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    # @user = User.find_by(username: params[:username])
    # if @user&.authenticate(params[:password])
    #   token = jwt_encode(user_id: @user.id)
    #   render json: { token: token }, status: :ok
    # else
    #   render json: { error: 'Invalid username / password' }, status: :unauthorized
    # end
    render json: { token: 'Test123' }, status: :ok
  end
end