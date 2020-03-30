# frozen_string_literal: true

class AddHeadersToWebsite < ActiveRecord::Migration[6.0]
  def change
    add_column :websites, :headers, :jsonb, null: false, default: {}
    add_index  :websites, :headers, using: :gin
  end
end
