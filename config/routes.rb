Rails.application.routes.draw do
  
  root to: 'pages#welcome'

  ##### STATIC PAGES #############

  get '/get-started' => 'pages#get_started', as: 'get_started'

  #################################
  devise_for :dispensaries, controllers: {registrations: 'dispensaries/registrations'}
  resources :dispensaries do 
    resources :deals
  end
end
