Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' }

  root 'home#index'

  get '/home', to: 'home#home'
  get '/index', to: 'home#index'

  get '/auth/twitter/callback', to: 'authorizations#twitterauth'

  resources :posts

  resources :profile, only: [:show, :edit, :update]


  resources :authorizations do
    member do
      get 'fbauth'
      get 'twitterauth'
    end
  end
end
