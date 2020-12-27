Rails.application.routes.draw do
  root 'home#index'
  get '/auth/google_oauth2/callback' => 'sessions#google_oauth'
  delete 'auth/logout' => 'sessions#destroy'
end
