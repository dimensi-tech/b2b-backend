Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :ads
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
  resources :profiles
  resources :term_agreements
  resources :travel_destinations
  resources :vouchers
  resources :voucher_usages

  resources :products do
    resources :packages
  end

  resources :bookings do
    collection do
      get :report
    end
  end
end
