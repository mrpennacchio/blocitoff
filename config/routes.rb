Rails.application.routes.draw do
  get 'items/create'

  # resources :users

  devise_for :users

  authenticated :user do
    root 'users#show', as: :authenticated_root
    resources :items, only: [:create]
  end

root 'welcome#index'
end
