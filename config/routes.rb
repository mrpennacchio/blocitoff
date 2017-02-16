Rails.application.routes.draw do
  # get 'items/create'
  devise_for :users

  resources :users, only: [:show] do
    resources :items, only: [:create]
  end

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

root 'welcome#index'
end
