Rails.application.routes.draw do

  get 'information/brackets_2014' => 'information#brackets_2014'

  get 'information/seeds' => 'information#seeds'

  get 'information/about' => 'information#about'

  get 'information/teams_entered' => 'information#teams_entered'

  get 'information/schedule' => 'information#schedule'

  get 'information/entry_information' => 'information#entry_information'

  get 'information/map_to_msj' => 'information#map_to_msj'

  get 'information/place_winners_2014' => 'information#place_winners_2014'

  get 'information/hotels' => 'information#hotels'

  get 'information/results_prior_years' => 'information#results_prior_years'

  get 'public/MSJ_2015_Champions.pdf' => 'information#champions_1990_to_2013'

  get 'wrestlers/sort_by_school' => 'wrestlers#sort_by_school'

  get 'wrestlers/sort_by_state_place' => 'wrestlers#sort_by_state_place'

  get 'users/home' => 'users#home'

  get 'users/send' => 'users#send', as: :send_welcome_mail

  # get 'users/wrestlers/no_entry' => 'users/wrestlers/#no_entry', as: :no_entry

  post 'create_user' => 'users#create', as: :create_user

  devise_for :users
  root 'welcome#index'


  resources :users, except: :create do
    resources :wrestlers, controller: "users/wrestlers"

  end

  resources :teams, only: [:index]

  resources :tournaments, only: [:index, :edit, :update]

  resources :wrestlers, only: [:index, :edit, :show, :update]

  controller :tournaments do
    delete '/tournaments/:id',      action: 'destroy'
  end

  controller :wrestlers do
    delete '/wrestlers/:id',      action: 'destroy'
  end

  controller :users do
    delete '/users/:id',      action: 'destroy'
  end

end
