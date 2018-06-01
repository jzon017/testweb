Rails.application.routes.draw do
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'phil' => 'pages#phil'
  get 'dtr' => 'employees#dtr'
  get 'signin', to: 'sessions#show'
  get 'signout', to: 'sessions#out'
  post 'signin', to: 'sessions#create'
  #get 'employees/dtr'
  #get '/pages', to: 'pages#phil', as: 'pages'
  #resources :employees
end
