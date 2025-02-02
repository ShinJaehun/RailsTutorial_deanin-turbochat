Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  get 'rooms/index'
  root 'pages#home'
  devise_for :users
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
  get 'user/:id', to: 'users#show', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
