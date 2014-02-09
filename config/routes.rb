Perky::Application.routes.draw do
  resources :purchases, only: [:index, :create]

  resources :perk_selections, only: [:index, :create, :destroy]

  resources :perks

  resources :accounts do
    resources :users
    get '/user/welcome/:token' => 'users#welcome', as: 'new_user_welcome'
    patch '/user/welcome' => 'users#set_initial_password', as: 'user_welcome'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  unauthenticated do
    root to: 'home#index'
  end

  authenticated :user do
    root :to => "perks#index", as: :authenticated_root
  end

end
