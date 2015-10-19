Rails.application.routes.draw do

  namespace :admin do
  get 'pages/dashboard'
  end

  resources :payments

  root to: 'pages#welcome'
  
  namespace :admin do 
    resources :dispensaries
    get 'dashboard' => 'pages#dashboard', as: 'dashboard'
  end
  

  ##### STATIC PAGES #############

  get '/how-it-works' => 'pages#how_it_works', as: 'how_it_works'
  get '/get-started' => 'pages#get_started', as: 'get_started'
  get '/support' => 'pages#support', as: 'support'
  get '/confirm_deal' => 'pages#confirm_deal', as: 'confirm_deal'
  get '/contact' => 'pages#contact', as: 'contact'
  
  
  ######## HOOKS ###############################################
  
  post '/test_purchase_url' => 'pages#test_purchase', as: 'test_purchase'
  #################################
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users do
    get '/dashboard' => 'users#dashboard', as: 'user_dashboard'
    resources :redemptions do 
      get '/redeem' => 'redemptions#redeem'
    end
  end


  devise_for :dispensaries, controllers: {registrations: 'dispensaries/registrations'}
  resources :dispensaries do
    resources :deals
    get '/menu' => 'dispensaries#menu', as: 'menu'
  end



  resources :dispensary_applications
  resources :support_inquiries, except: [:new]


end
