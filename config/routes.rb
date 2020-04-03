# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :friendships, only: %i[create]
  resources :users, only: %i[index show create]
end
