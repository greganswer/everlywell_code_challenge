# frozen_string_literal: true

class AddFriendsCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :friends_count, :integer, null: false, default: 0
  end
end
