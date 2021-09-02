Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create]
  resources :contractors, only: [:index, :show, :update, :destroy]
  resources :musicians, only: [:index, :show, :update, :destroy]
  resources :projects
  resources :instruments
  resources :genres
end
