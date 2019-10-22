Rails.application.routes.draw do
  resources :merchants
  resources :passports
  resources :packages
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products
  resources :profiles
  resources :identities
  resources :term_agreements
end
