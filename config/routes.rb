Rails.application.routes.draw do
  root 'home#index'

  scope :auth do
    get 'google_oauth2/callback' => 'sessions#google_oauth'
    get 'login' => 'sessions#new'
    delete 'logout' => 'sessions#destroy'
  end

  resources :messages, only: :create
end
