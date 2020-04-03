# frozen_string_literal: true

class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_one :website

  # Reference: https://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
  accepts_nested_attributes_for :website

  validates :first_name, presence: true
  validates :last_name, presence: true

  def as_json(options = {})
    defaults = {
      only: %i[id first_name last_name friends_count],
      include: {
        website: { only: %i[url headers] }
      }
    }
    super(defaults.merge(options))
  end
end
