# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :friends_count

  has_many :friends
  has_one :website
end
