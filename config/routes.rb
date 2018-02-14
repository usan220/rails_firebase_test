Rails.application.routes.draw do
  root :to => "home#index"
  get'/auth/google_oauth2/callback' , to: "home#index"
  post'/auth/google_oauth2/callback' , to: "home#index"
  get '/auth/failure', to: "home#index"
end
