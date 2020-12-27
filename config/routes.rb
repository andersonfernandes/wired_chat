Rails.application.routes.draw do
  root 'home#index'
  get '/auth/google_oauth2/callback' => 'sessions#google_oauth'
end
