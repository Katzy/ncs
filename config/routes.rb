Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :users, only: [:index]

  resources :teams do
    resources :wrestlers, controller: "teams/wrestlers"
  end

  resources :wrestlers, only: [:show, :edit]

  controller :wrestlers do
    delete '/wrestlers/:id',      action: 'destroy'
  end

end
