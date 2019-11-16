Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :countries
  resources :facilities
  resources :merchants
  resources :identities
  resources :packages
  resources :passports
  resources :products
  resources :profiles
  resources :term_agreements
  resources :travel_destinations
end
