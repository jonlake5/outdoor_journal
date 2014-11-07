OutdoorJournal::Application.routes.draw do


  get "adventure_tags/new"
  get "adventure_tags/create"
  get "adventure_tags/update"
  get "adventure_tags/edit"
  resources :adventure_types, only: [:edit, :new, :create, :destroy, :index, :show, :update]
  get "adventure_types/:id", to: 'adventure_types#show'
  get "adventure_types/new"
  get "adventure_types/edit"
  delete "adventure_types/destroy"
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  root  'static_pages#home'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'

  delete "adventure_coordinates/destroy_all_for_adventure"

  resources :adventure_tags, only: [:new, :edit, :create, :destroy]

  get "adventures/test"
  get "adventures/upload"
  post "adventures/parse"
  resources :adventures
  get "adventures/create"
  get "adventures/show"
  get "adventures/edit"
  delete "adventures/destroy"
  resources :users
  get "users/new"
  match '/signup', to: 'users#new', via: 'get'
  get 'users/:id', to: 'users#show', as: 'profile'
#  match '/profile', to: 'users#show', via: 'get'
## Adventure Coordinates
  get 'adventure_coordinates/edit'
  delete 'adventure_coordinates/delete_coords'




##Sign in form
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
##adventure_types

 # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
