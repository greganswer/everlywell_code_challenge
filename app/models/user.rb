# frozen_string_literal: true

class User < ApplicationRecord
  has_one :website

  # Reference: https://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
  accepts_nested_attributes_for :website

  validates :first_name, presence: true
  validates :last_name, presence: true

  def as_json(_options = {})
    super(
      only: %i[id first_name last_name],
      include: {
        website: { only: [:url] }
      }
    )
  end
end
