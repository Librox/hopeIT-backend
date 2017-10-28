# frozen_string_literal: true

Rails.application.routes.draw do
  resources :donors, only: %i[show index]
  resources :messages, only: %i[new create show]

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
