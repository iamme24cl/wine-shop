Rails.application.routes.draw do

  get 'login_status' => 'users#login_status'

  resources :users, only: [:index, :create, :update, :destroy]
  resources :sessions, only: [:create, :destroy]

end
