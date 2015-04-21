BoardGameRails::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'users/:id' => 'users#show', :as => :user
  # get 'plays/' => 'plays#index', :as => :plays
  get 'games/search' => 'games#search', :as => :games_search
  get 'games/:id(.:format)/add' => 'games#add', :as => :add_game
  get 'games/:id/remove' => 'games#remove', :as => :remove_game
  match 'games/suggest' => 'games#suggest', :via => [:get, :post], :as => :suggest_game
  resources :plays, except: [:new, :destroy, :show]
  get 'plays/:id' => 'plays#new', :as => :new_play
  get 'collection/search/' => 'games#search_collection', :as => :collection_search
  # get 'plays/:id' => 'plays#new', :as => :new_play
  resources :games
  # get 'games/' => 'games#index', :as => :games

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
