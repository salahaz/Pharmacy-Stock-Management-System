Rails.application.routes.draw do

  get 'sales/new'

  get 'sales/update'

  get 'sales/index'

  get 'stocks/new'

  get 'sessions/new'

  #match '/stocks/new/', to: 'stock#new', as: 'new_stocks'
  root 'static_pages#overview'
  root 'sessions#new'
  get '/inventory', to: 'static_pages#inventory'
  get '/overview', to: 'static_pages#overview'
  get '/orderhistory', to: 'static_pages#orderhistory'
  get '/finances', to: 'static_pages#finances'
  get '/employees', to: 'users#index'
  get '/providers', to: 'provider#index'
  get '/addprovider', to:'provider#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/bls/index', to: 'bls#index'
  get '/stocks', to: "stocks#index"
  get '/sales/quantity', to: "sales#quantity"
  post '/login', to: 'sessions#create'
  post '/providers', to: 'provider#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users
  resources :medicines
  resources :bls
  resources :stocks
  resources :providers
  resources :sales
  resources :sales_steps

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
