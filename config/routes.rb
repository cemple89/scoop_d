Rails.application.routes.draw do

  root"locations#index"

  resources :locations do
    resources :reviews  
  end

  resources :reviews do
    resources :comments, only: [:new, :create]
  end

end
