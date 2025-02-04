# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'static_pages#home'
  resources :posts do
    resources :comments
  end

  resources :posts do
    resources :likes
  end

  resources :users do
    resource :profile
  end

  get '/:id', to: 'users#show'
  post '/:id', to: 'posts#create'

  root 'posts#index'
end
