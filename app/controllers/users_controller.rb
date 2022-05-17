class UsersController < ApplicationController

    require 'rspotify/oauth' 

    $tracks = []
    def spotify
        @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        session[:spotify_user_hash] = @spotify_user.to_hash

        @playlists = @spotify_user.playlists

    end 

    def createArt
        @playlist = params[:playlistInput]
        puts @playlist 
        #@spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        #session[:spotify_user_hash] = @spotify_user.to_hash
        @spotify_user = RSpotify::User.new(session[:spotify_user_hash])
        
        @id = @playlist.slice!(0)
    
        @pl = @spotify_user.playlists[@id.to_i]

        puts @pl.id 

        @tracks = @pl.tracks


       
    end 
end
