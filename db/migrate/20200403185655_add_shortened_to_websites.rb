class AddShortenedToWebsites < ActiveRecord::Migration[6.0]
  def change
    add_column :websites, :shortened, :string
  end
end
