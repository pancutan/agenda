Rails.application.routes.draw do
  # root 'users#index'
  root 'landing#bienvenido'

  get 'landing/bienvenido'
  get 'landing/adios'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :countries
  resources :provinces
  resources :types

  resources :phones
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
