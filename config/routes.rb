Rails.application.routes.draw do
  resources :offers
  resources :users
  get 'auth/login', to: 'authentication#login'
end
