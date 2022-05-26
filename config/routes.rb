# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :contacts
end
