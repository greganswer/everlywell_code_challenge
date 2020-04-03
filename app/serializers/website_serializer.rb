# frozen_string_literal: true

class WebsiteSerializer < ActiveModel::Serializer
  attributes :id, :url, :shortened, :headers
end
