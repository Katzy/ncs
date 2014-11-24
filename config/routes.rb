Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  root 'welcome#index'

  resources :users, only: [:show, :edit, :update]

  resources :teams do
    resources :wrestlers, only: [:index, :new, :create], controller: "teams/wrestlers"
  end

  resources :wrestlers, only: [:edit, :update, :show]

  controller :wrestlers do
    delete '/wrestlers/:id',      action: 'destroy'
  end

end
