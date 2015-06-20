Rails.application.routes.draw do

  root 'home#show'

  resource :home, controller: :home, only: [:show] do
    collection do
      post :fraction_description
      post :search_places
      get :autocomplete_waste_street
      get :autocomplete_phrase_name
      get :fractions_places
    end
  end

  resources :place_info, controller: :place_info, only: [:show] do
    get :all_places, on: :collection
    get :mobile_map, on: :member
  end

  scope :geolocations, controller: :geolocations, as: :geolocations do
    get :pharmacies
    get :wet_and_dry_wastes
    get :hazardous_wastes
    get :bulky_wastes
    get :packaging_wastes
  end

  devise_for :admin

  namespace :service do
    root 'dashboard#show'
    resource :admin, controller: :admin, only: [:edit, :update]
    resource :dashboard, controller: :dashboard, only: :show
    resources :pharmacies,         only: [:new, :create]
    resources :wet_and_dry_wastes, only: [:new, :create]
    resources :hazardous_wastes,   only: [:new, :create]
    resources :bulky_wastes,       only: [:new, :create]
    resources :packaging_wastes,   only: [:new, :create]
    resources :phrases do
      collection do
        get :new_import_data
        post :import_data
      end
    end
    resources :descriptions
    resources :fractions
  end
end
