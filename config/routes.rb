Rails.application.routes.draw do
  root "homes#home"
  get "/help", to: "homes#help"
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

  namespace :admin do
    root "homes#index"
    resources :users, except: [:edit, :update]
    resources :genres
    resources :artists
  end
end
