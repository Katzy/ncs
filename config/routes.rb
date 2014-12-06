Rails.application.routes.draw do

  get 'information/about' => 'information#about'

  get 'information/teams' => 'information#teams'

  get 'information/entry_information' => 'information#entry_information'

  get 'information/map_to_msj' => 'information#map_to_msj'

  get 'information/place_winners_2014' => 'information#place_winners_2014'

  get 'information/hotels' => 'information#hotels'

  get 'information/results_prior_years' => 'information#results_prior_years'

  get 'information/champions_1990_to_2013' => 'information#champions_1990_to_2013'

  get 'wrestlers/sort_by_school' => 'wrestlers#sort_by_school'

  get 'wrestlers/sort_by_state_place' => 'wrestlers#sort_by_state_place'

  devise_for :users
  root 'welcome#index'

  resources :users, only: [:index]

  resources :teams do
    resources :wrestlers, controller: "teams/wrestlers"
    resources :tournaments, controller: "teams/tournaments"
  end

  resources :tournaments, only: [:index, :edit, :update]

  resources :wrestlers, only: [:index, :edit, :show, :update]

  controller :tournaments do
    delete '/tournaments/:id',      action: 'destroy'
  end

  controller :wrestlers do
    delete '/wrestlers/:id',      action: 'destroy'
  end

end
