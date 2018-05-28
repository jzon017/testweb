Rails.application.routes.draw do
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'phil' => 'pages#phil'
  #get '/pages', to: 'pages#phil', as: 'pages'
  #resources :pages
end
