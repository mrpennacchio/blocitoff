Rails.application.routes.draw do
  # resources :users

  devise_for :users

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

root 'welcome#index'
end
