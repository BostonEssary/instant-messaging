Rails.application.routes.draw do
  get 'chats/index'
  get 'chats/create'
  get 'chats/new'
  get 'chats/show'
  get 'messages/create'
  get 'messages/new'
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: [:show, :index]

  resources :messages
  resources :chats do
    resources :messages
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
