Perky::Application.routes.draw do
  resources :email_leads

  resources :purchases, only: [:index, :create]

  resources :perk_selections, only: [:index, :create, :destroy]

  resources :perks

  resources :email_leads, only: [:create]
  
  resources :accounts do
    resources :users
    get '/user/welcome/:token' => 'users#welcome', as: 'new_user_welcome'
    patch '/user/welcome' => 'users#set_initial_password', as: 'user_welcome'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users, only: [:update, :destroy]
  match '/user/invite' => 'users#invite', via: [:post]

  unauthenticated do
    root to: 'home#index'
  end

  authenticated :user do
    root :to => "perks#index", as: :authenticated_root
  end

end
