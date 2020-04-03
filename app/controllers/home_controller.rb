# frozen_string_literal: true

# Non resource routes.
class HomeController < ApplicationController
  def index
    render json: {
      name: 'Experts Directory Search Tool',
      environment: Rails.env,
      description: 'Search for experts based on headings on their personal website',
      version: '0.1.0'
    }
  end
end
