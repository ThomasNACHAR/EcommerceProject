Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "test", to: "test#index"

  root "home#index"

  get "menu", to: "products#menu"

  scope '/notifications' do
    get 'delete/:id' => "application#delete_notification", as: 'delete_notification'
  end

  resource :user do
    get 'login'
    post 'login'
    get 'register'
    post 'register'
    get 'logout'
  end

  resources :products, only: [:index, :show], param: :slug

  namespace :admin do
    resources :products, param: :slug
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
