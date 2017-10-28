# frozen_string_literal: true

Rails.application.routes.draw do
  resources :donors, only: %i[show index]
  resources :messages, only: %i[new create show]
  devise_for :admins
  apipie
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "payu/token", to: "payu#token"
      post "payments/payu", to: "payments#payu"
      resources :patients, only: [:index]
      resources :donations, only: [:create]
      resources :payments, only: [:index]
    end
  end
end
