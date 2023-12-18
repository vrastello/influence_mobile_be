# frozen_string_literal: true

class Api::AuthenticationController < Api::ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token, role: @user.role }, status: :ok
    else
      render json: { error: 'Invalid username / password' }, status: :unauthorized
    end
  end
end