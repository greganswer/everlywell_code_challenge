# frozen_string_literal: true

class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :friend_id, :mutual_friend_id
end
