Rails.application.routes.draw do
  resources :merchants
  resources :identities
  resources :packages
  resources :passports
  resources :products
  resources :profiles
  resources :term_agreements
  resources :travel_destinations
end
