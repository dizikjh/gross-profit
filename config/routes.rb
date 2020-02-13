Rails.application.routes.draw do

  get '/pages/home' => 'pages#home'
  get '/pages/about' => 'pages#about'
  get '/pages/contact' => 'pages#contact'
  get '/pages/details' => 'pages#details'
  resources :items
  
  #for importing page from index view
  resources :items_imports, only: [:new, :create]
  get 'items_imports/new'
  get 'items_imports/create'

  #start pages 
  root to: 'items#index'


end
