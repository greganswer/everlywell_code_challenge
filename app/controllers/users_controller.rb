# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all

    render json: @users, each_serializer: Users::IndexSerializer
  end

  # GET /users/1
  def show
    @user = User.includes(%i[website]).find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.website.get_additional_info

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(
      :first_name, :last_name,
      website_attributes: [:url]
    )
  end
end
