Rails.application.routes.draw do

  root to: "topics#index"

  resources :topics
  resources :comments, only: [:create, :update, :destroy]

  devise_for :users,
    controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
    }

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
