Rails.application.routes.draw do
  
  get 'deals/show'

  get 'deals/index'

  get 'deals/new'

  get 'deals/create'

  get 'deals/edit'

  get 'deals/update'

  get 'deals/destroy'

  root to: 'pages#welcome'

  ##### STATIC PAGES #############
  get '/get-started' => 'pages#get_started', as: 'get_started'
  
  devise_for :dispensaries
  resources :dispensaries do 
    resources :deals
  end
end
