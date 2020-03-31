Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :pictures, only: [:new, :create]
  end
  root to: "items#index"


  resources :users, only: [:show, :edit, :update] do
    resources :carts do
      resources :join_item_carts
    end
  end

  get 'contact', to:'static#contact'
  resources :orders

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
