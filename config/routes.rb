Rails.application.routes.draw do
  namespace :admin do
    resources :users, :patients, :doctors, :offices, :addresses, :employees,
              :insurance_carriers, :insurance_plans, :accepted_plans

    root to: "users#index"
  end

  devise_for :users, controllers: { registrations: 'user/registrations' }
  devise_for :patients, controllers: { registrations: 'user/registrations' }
  devise_for :doctors, controllers: { registrations: 'user/registrations' }

  resources :users, :doctors, :patients
  resources :offices do
    resources :claims
  end

  root to: 'static#home'

  get '/about', to: 'static#about', as: 'about'
  get '/contact', to: 'static#contact', as: 'contact'
  get '/faq', to: 'static#faq', as: 'faq'
  get '/privacy', to: 'static#privacy', as: 'privacy'
  get '/terms', to: 'static#terms', as: 'terms'
end
