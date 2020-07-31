Camps::Application.routes.draw do

  resources :invoices

  resources :camp_interests

  resources :weekly_programs

  resources :camp_surveys do
    collection { post :import }
  end

  resources :coupon_codes do
    collection { get :facebook_share }
  end

  devise_for :users, :skip => [:registrations]
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'
    end

  resources :locations


  resources :offerings do
    collection { post :import }
  end

  resources :courses do
    collection do
      get :descriptions
      post :import
    end
  end

  resources :registrations do
    collection do
      get :outstanding_payments
      get :total_discounts
      get :confirmation
    end
  end


  root :to => 'pages#home'

  get '/faq', to: 'pages#faq'
  get '/comparison', to: 'pages#comparison'
  get '/email_confirmation', to: 'registrations#email_confirmation'
  get '/email_reminder', to: 'registrations#email_reminder'
  get '/thank_you', to: 'pages#thank_you'
  get '/testimonials', to: 'pages#testimonials'
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'
  post 'coupon_codes/code_lookup', to: 'coupon_codes#code_lookup'
  post 'offerings/week_at_a_glance', to: 'offerings#week_at_a_glance'
  get 'camp_surveys/contacted/:id', to: 'camp_surveys#contacted'
  get '/googlea898a912abc4e23c', to: 'pages#googlea898a912abc4e23c'
end
