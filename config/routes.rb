Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :listings, only: [:index, :show]
  resources :reservations do
    member do
      post '/cancel' => 'reservations#cancel'
    end
  end
  post 'webhooks/:source' => 'webhooks#create'

  namespace :host do
    resources :merchant_settings do
      collection do
        get '/connect' => 'merchant_settings#connect'
        get '/connected' => 'merchant_settings#connected'
      end
    end
    resources :listings do 
      resources :photos, only: [ :index, :new, :create, :destroy ]
      resources :rooms, only: [:index, :create, :destroy]
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end
