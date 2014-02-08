Perky::Application.routes.draw do
  resources :purchases

  resources :perk_selections

  resources :perks

  resources :accounts

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end