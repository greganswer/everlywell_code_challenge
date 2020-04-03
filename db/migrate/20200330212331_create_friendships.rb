# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.references :mutual_friend, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :friendships, %i[user_id friend_id], unique: true
  end
end
