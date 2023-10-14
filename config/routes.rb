Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :posts  # Define the route for the user's posts
  end
  
  resources :posts, only: [:new, :create]
  resources :comments, only: [:new, :create]
  resources :likes, only: [:new, :create]

 
end
