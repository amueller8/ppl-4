require 'rspotify/oauth'


Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, "a7489f3ea4c44c3ab00f03537edfdec1", "579b61bef4e94543ac5fdec9c7097abe", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
  end
  
  OmniAuth.config.allowed_request_methods = [:post, :get]

