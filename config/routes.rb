Rails.application.routes.draw do

  root to: 'pages#welcome'

  ##### STATIC PAGES #############

  get '/get-started' => 'pages#get_started', as: 'get_started'
  get '/confirm_deal' => 'pages#confirm_deal', as: 'confirm_deal'

  #################################
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users do
    resources :redemptions

  end


  devise_for :dispensaries, controllers: {registrations: 'dispensaries/registrations'}
  resources :dispensaries do
    resources :deals
  end

  resources :dispensary_applications

  
end
