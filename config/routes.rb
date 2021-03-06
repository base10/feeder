Rails.application.routes.draw do
  resources :publications

  resources :feeds do
    resources :entries, only: [:edit, :update]
    resource :fetch, only: [:create]
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get "/sign_up" => "users#new"
  get "/sign_in" => "sessions#new"
  get "/sign_out" => "sessions#destroy"

  root "publications#index"
end
