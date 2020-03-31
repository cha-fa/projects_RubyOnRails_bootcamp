Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendances
    resources :event_pictures, only: [:create]
  end
  root 'events#index'
  resources :users
  resources :charges

  namespace :admin do
    root 'admin#index'
    resources :users, :events, :event_submissions
  end
end
