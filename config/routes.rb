# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :patients, only: [:index]
      resources :donations, only: [:create]
    end
  end
end
