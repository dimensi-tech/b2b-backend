Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :ads
  resources :bookings
  resources :categories
  resources :countries
  resources :customers
  resources :discounts
  resources :email_templates
  resources :icons
  resources :facilities
  resources :identities
  resources :merchants
  resources :passports
  resources :wifi_roamings
  resources :products do
    resources :packages
  end
  resources :profiles
  resources :term_agreements
  resources :travel_destinations
  resources :vouchers
  resources :voucher_usages
end
