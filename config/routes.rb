Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'home#show'

  resource :home, controller: :home, only: [:show] do
    collection do
      post :fraction_description
      post :search_places
      get :autocomplete_wastes
      get :autocomplete_phrases
      get :autocomplete_locations
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
    get :battery_points
  end

  get 's/:slug', to: 'static_pages#show', as: :static_page

  devise_for :admin, skip: [:registrations] 
  devise_for :employees, skip: [:registrations] 

  namespace :service do
    root 'dashboard#show'
    resource :admin, controller: :admin, only: [:edit, :update]
    resource :dashboard, controller: :dashboard, only: :show
    resources :pharmacies,         only: [:new, :create]
    resources :wet_and_dry_wastes, only: [:new, :create]
    resources :hazardous_wastes,   only: [:new, :create]
    resources :bulky_wastes,       only: [:new, :create]
    resources :packaging_wastes,   only: [:new, :create]
    resources :battery_points,   only: [:new, :create]


    resources :locations,   only: [:new, :create]
    resources :phrases do
      collection do
        get :new_import_data
        post :import_data
      end
    end
    resources :fractions, except: :show
    resources :employees, except: :show
    resources :logs, only: [:index]
    resources :static_pages,   except: [ :show ]

    get 'settings', to: 'settings#edit', as: :settings
    post 'settings', to: 'settings#update'
  end

  namespace :zut do
    # resource :employee, controller: :admin, only: [:edit, :update]
    resources :containers
  end
end
