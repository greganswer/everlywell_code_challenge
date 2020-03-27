# frozen_string_literal: true

class Website < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validate :url_valid

  def as_json(_options = {})
    super(only: %i[url])
  end

  private

  def url_valid
    begin
      uri = URI.parse(url)
      is_valid = uri.host.present? && (uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS))
    rescue StandardError
      is_valid = false
    end
    errors.add(:url) unless is_valid
  end
end
