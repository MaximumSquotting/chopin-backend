# frozen_string_literal: true
Rails.application.routes.draw do
  resources :payments
  resources :offers
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth", skip: [:omniauth_callbacks]
      resources :payments, only: [:index, :show, :create]
      get "/offers/my", to: "offers#my"
      get "/offers/chipped_in", to: "offers#chipped_in"
      resources :offers, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
