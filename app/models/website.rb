# frozen_string_literal: true

require 'open-uri'

class Website < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validate :url_valid

  # NOTE: This makes HTTP requests which can introduce latency.
  def get_additional_info
    get_headers
    shorten_url
  end

  # Get all the h1, h2, and h3 headings from the website.
  # NOTE: This makes an HTTP request which can introduce latency.
  def get_headers
    document = Nokogiri::HTML(open(url))
    values = []

    %i[h1 h2 h3].each do |header|
      document.css(header).children.each do |child|
        if child.text.strip.present?
          values << { title: child.text.strip, header_type: header }
        end
      end
      self.headers = values
    end
  end

  # Create a short link using the Bitly API.
  # NOTE: This makes an HTTP request which can introduce latency.
  def shorten_url
    return unless valid?

    token = Rails.application.credentials.bitly[:token]
    self.shortened = Bitly::API::Client
                     .new(token: token)
                     .shorten(long_url: url)
                     .link
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
