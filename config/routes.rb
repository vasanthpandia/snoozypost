Rails.application.routes.draw do
  devise_for :users, controllers: { registration: 'users/registrations', sessions: 'users/sessions' }

  root 'home#home'

  match '/home',    to: 'home#index',    via: 'get'

  match '/auth/twitter/callback', to: 'authorizations#twitterauth', via: 'get'

  resources :post

  resources :home do
    member do
      get 'home'
      get 'index'
    end
  end

  resources :authorizations do
    member do
      get 'fbauth'
      get 'twitterauth'
    end
  end

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
