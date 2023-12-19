# frozen_string_literal: true

class Api::V1::UsersController < Api::ApplicationController
  skip_before_action :authenticate_request, only: %i[create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :birthdate, :gender, :password)
  end
end
