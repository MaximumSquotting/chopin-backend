# frozen_string_literal: true
Rails.application.routes.draw do
  resources :offers
  devise_for :users
end
