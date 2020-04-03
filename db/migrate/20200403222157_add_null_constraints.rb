# frozen_string_literal: true

class AddNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
    change_column_null(:websites, :url, false)
  end
end
