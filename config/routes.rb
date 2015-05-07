Rails.application.routes.draw do
  resources :feeds
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get "/sign_up" => "users#new"
  get "/sign_in" => "sessions#new"
  get "/sign_out" => "sessions#destroy"

  root "feeds#index"
end
