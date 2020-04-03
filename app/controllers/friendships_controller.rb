# frozen_string_literal: true

class FriendshipsController < ApplicationController
  # POST /friendships
  def create
    @friendship = Friendship.create_reciprocal_for_ids(friendship_params).first
    render json: @friendship, status: :created
  end

  private

  # Only allow a trusted parameter "white list" through.
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :mutual_friend_id)
  end
end
