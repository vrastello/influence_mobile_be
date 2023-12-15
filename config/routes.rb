Rails.application.routes.draw do
  namespace :api do
    post 'auth/login', to: 'authentication#login'
    namespace :v1 do
      resources :offers
      resources :users
    end
  end
end
