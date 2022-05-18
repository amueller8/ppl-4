Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "homepage#index"
  
  get '/auth/spotify/callback', to: 'users#spotify'

  post "/"=> "users#createArt"
  

end
