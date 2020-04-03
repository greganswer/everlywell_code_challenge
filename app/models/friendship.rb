# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user, counter_cache: :friends_count
  belongs_to :friend, class_name: 'User'
  belongs_to :mutual_friend, class_name: 'User', optional: true

  validates :user, uniqueness: { scope: :friend }

  # Creates 2 Friendship records in order to simulate a bi-directional relationship.
  # Reference: https://medium.com/@miss.leslie.hsu/001-mutual-friendships-on-your-app-in-4-easy-steps-55cb27622585
  def self.create_reciprocal_for_ids(input)
    attributes = { user_id: input[:user_id], friend_id: input[:friend_id] }
    user_friendship = Friendship.where(attributes).first_or_create

    attributes = { user_id: input[:friend_id], friend_id: input[:user_id] }
    friend_friendship = Friendship.where(attributes).first_or_create do |friendship|
      friendship.mutual_friend = input[:mutual_friend]
    end

    [user_friendship, friend_friendship]
  end
end
