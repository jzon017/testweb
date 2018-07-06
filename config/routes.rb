Rails.application.routes.draw do
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'phil' => 'pages#phil'
  get 'dtr' => 'employees#dtr'
  get 'contact' => 'pages#contact'
  get 'services' => 'pages#services'
  get 'home' => 'welcome#home'
  
  #Signin
  get 'signin', to: 'sessions#show'
  get 'signout', to: 'sessions#out'
  post 'signin', to: 'sessions#create'
  
  #Signup
  get 'dtr', to: 'employees#dtr'
  post 'dtr', to: 'employees#create'

  #dtrmain
  get 'dtrmain', to: 'employees#dtrmain'
  post 'dtrmain', to: 'employees#gettime'
  #get 'employees/dtr'
  #get '/pages', to: 'pages#phil', as: 'pages'
  #resources :employees

  #dtroutput
  get 'dtr_output', to: 'employees#dtr_output'

  #logout
  #post 'signout', to: 'sessions#out'

  #forgot password
  get 'reg', to: 'employees#reg'
  post 'reg', to: 'employees#forgotpass'
end
