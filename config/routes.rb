Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :ads
  resources :bookings
  resources :categories
  resources :countries
  resources :discounts
  resources :icons
  resources :facilities
  resources :identities
  resources :merchants
  resources :packages
  resources :passports
  resources :products
  resources :profiles
  resources :term_agreements
  resources :travel_destinations
  resources :voucher_usages
end
