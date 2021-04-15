Rails.application.routes.draw do
  resources :novels
  resources :genres
  # resources :authors, only: :index
  namespace :api do
    namespace :v1 do
      get 'authors' => 'authors#index'
      get 'authors/:id', to: 'authors#show'
      post 'authors', to: 'authors#create'
      put 'authors/:id', to: 'authors#update'
      delete 'authors/:id', to: 'authors#destroy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
