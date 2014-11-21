Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  root 'welcome#index'

  resources :users, only: [:show, :edit, :update]

  resources :teams
end
