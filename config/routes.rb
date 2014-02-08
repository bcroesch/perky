Perky::Application.routes.draw do
  resources :purchases

  resources :perk_selections

  resources :perks

  resources :accounts do
    resources :users
  end

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}


end
