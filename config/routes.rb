Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'adduser', to: 'users/create'
      get 'users', to: 'users#index'
      get 'users/:id', to: 'users#show'
      delete 'users/:id', to: 'users#destroy'
      patch 'users/:id', to: 'users#update'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "user#index"
end
