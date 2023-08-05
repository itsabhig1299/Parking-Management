Rails.application.routes.draw do
  get 'tickets/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars
  resources :parkings
  resources :spots
  resources :tickets do 
    put :checkout, on: :member
  end

end
