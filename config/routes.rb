Rails.application.routes.draw do
  resources :countries
  resources :provinces
  resources :types
  get 'landing/bienvenido'

  get 'landing/adios'

  #root 'users#index'
  root 'landing#bienvenido'

  resources :phones
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
