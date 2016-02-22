Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "topics#index"

  resources :topics
  resources :comments, only: [:create, :update, :destroy]

  devise_for :users,
    controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
    }

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # Serve websocket cable requests in-process
  # Currently disabled, but kept commented for future references, as launching
  # the ActionCable server on another process allows better process management &
  # granular scaling:
  # mount ActionCable.server => '/cable'
end
