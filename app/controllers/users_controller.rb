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

        @tracks = @pl.tracks

        puts @tracks 

        $tracks << @tracks

        #figure out a redirect back to the spotify.html.erb page
        redirect_back(fallback_location: root_path)

       
    end 
end
