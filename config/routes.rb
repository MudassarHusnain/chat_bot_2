Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  # get 'messages/new'
  # get 'rooms/index'
  # get 'rooms/show'
  # get 'rooms/new'
  resources :rooms do
    resources :messages
  end
  root "rooms#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
