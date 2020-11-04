Rails.application.routes.draw do
  resources :travel_partners
  scope "(:locale)", locale: /id|en/ do
    get '/:locale' => 'homes#index'
    root 'homes#index'
    devise_for :users

    resources :ads
    resources :roles
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
    resources :packages
    resources :profiles
    resources :policies
    resources :term_agreements
    resources :travel_destinations
    resources :user_managements
    resources :vouchers
    resources :voucher_usages

    resources :products do
      resources :packages
    end

    resources :bookings do
      collection do
        get :detail_savings
        get :report
      end
    end
  end
end
