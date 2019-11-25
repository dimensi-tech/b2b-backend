Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :ads
  resources :bookings
  resources :countries
  resources :facilities
  resources :merchants
  resources :icons
  resources :identities
  resources :packages
  resources :passports
  resources :products
  resources :profiles
  resources :term_agreements
  resources :travel_destinations
end
