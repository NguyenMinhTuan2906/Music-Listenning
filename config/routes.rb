Rails.application.routes.draw do
  root "homes#home"
  get "/about", to: "homes#about"
  get "/contact", to: "homes#contact"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :songs
  resources :comments, only: [:new, :create]
  resources :ratings, only: [:new, :create, :show]
  resources :genres

  namespace :admin do
    root "homes#index"
    resources :users, except: [:edit, :update]
    resources :genres
    resources :artists
    resources :songs, only: [:index, :destroy]
  end
end
