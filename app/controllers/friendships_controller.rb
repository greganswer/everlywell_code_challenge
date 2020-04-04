# frozen_string_literal: true

class FriendshipsController < ApplicationController
  # POST /friendships
  def create
    @friendship = Friendship.create_reciprocal_for_ids(friendship_params).first
    if @friendship.valid?
      render json: @friendship, status: :created
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :mutual_friend_id)
  end
end
