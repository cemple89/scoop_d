# frozen_string_literal: true
Rails.application.routes.draw do
  root 'locations#index'
  post 'locations/:id' => 'votes#create'

  resources :locations do
    resources :reviews do
      resources :votes
    end
  end

  # resources :reviews do
  #   resources :votes
  # end

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users


end
