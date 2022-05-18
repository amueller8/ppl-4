require 'rspotify/oauth'

#This code was taken from the rspotify documentation https://github.com/guilhermesad/rspotify 
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, "<client_id>", "<client_secret>", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
  end
  
  OmniAuth.config.allowed_request_methods = [:post, :get]

