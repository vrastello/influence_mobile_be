Rails.application.routes.draw do
  resources :offers
  resources :users
  post 'auth/login', to: 'authentication#login'
end
