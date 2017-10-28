# frozen_string_literal: true

Rails.application.routes.draw do
  root "donors#index"
  resources :donors, only: %i[index show]
  resources :messages, only: %i[index show new create]
  resources :notifications, only: %i[new create]
  devise_for :admins
  apipie
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "payu/token", to: "payu#token"
      post "payments/payu", to: "payments#payu"
      resources :donors, only: [:index]
      resources :patients, only: [:index]
      resources :donations, only: [:create]
      resources :payments, only: [:index]
      resources :messages, only: [:index]
    end
  end
end
