Perky::Application.routes.draw do
  resources :purchases, only: [:index, :create]

  resources :perk_selections, only: [:index, :create, :destroy]

  resources :perks

  resources :accounts do
    resources :users
    get '/user/welcome/:token' => 'users#welcome', as: 'new_user_welcome'
    post '/user/welcome/:user_id' => 'users#welcome_create', as: 'update_new_user_welcome'
  end


  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

end
