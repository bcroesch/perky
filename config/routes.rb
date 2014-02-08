Perky::Application.routes.draw do
  resources :purchases, only: [:index, :create]

  resources :perk_selections, only: [:index, :create, :destroy]

  resources :perks

  resources :accounts do
    resources :users
  end

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}


end
