
 Rails.application.routes.draw do

  root 'gossips#index'
  get 'welcome/:user_entry/', to: 'dynamic_home#home', as:'welcome'
  get 'contact/', to: 'dynamic_home#contact'
  get 'team/', to: 'dynamic_home#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :gossips do
  resources :comments
  resources :likes, only: [:new, :create, :destroy]
end
resources :users
resources :cities, only: [:show, :index]
resources :sessions, only: [:new, :create, :destroy]
end 
 
 