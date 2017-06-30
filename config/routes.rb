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

  namespace :admin do
    root "homes#index"
    resources :users, only: [:show, :index, :destroy]
  end
end
