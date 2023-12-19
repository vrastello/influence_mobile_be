Rails.application.routes.draw do
  namespace :api do
    post 'auth/login', to: 'authentication#login'
    namespace :v1 do
      get 'admin_offers', to: 'offers#admin_offers'
      patch 'log_play_hours', to: 'offers#log_play_hours'
      resources :offers
      resources :users
    end
  end
end
