class UsersController < ApplicationController

    require 'rspotify/oauth' 

    
    def spotify


        @allLsts= Lst.all

        if @allLsts.size > 0
            
            @recent = RSpotify::Playlist.find_by_id(@allLsts[@allLsts.size - 1].spotify_id)
            @recent_tracks = @recent.tracks.sort_by {|t| t.popularity}
            
            puts "There are #{@allLsts.size} playlists (spotify)."
        end 

        @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        session[:spotify_user_hash] = @spotify_user.to_hash

        @playlists = @spotify_user.playlists

        

    end 

    def createArt
        #@allLsts= Lst.all
        #puts "There are #{@allLsts.size} playlists."


        @playlist = params[:playlistInput]
        puts @playlist 
        #@spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        #session[:spotify_user_hash] = @spotify_user.to_hash
        @spotify_user = RSpotify::User.new(session[:spotify_user_hash])
        
        @id = @playlist.slice!(0)
    
        @pl = @spotify_user.playlists[@id.to_i]

        puts "ID is," + @pl.id.to_s

        map = {"title" => @playlist, "spotify_id"=> @pl.id.to_s}

        newRow = Lst.new(map)

        respond_to do |format|
            if newRow.save
                puts("success! ")
                    format.html {redirect_to '/auth/spotify/callback' }
            end

        end

    
       
    end 
end
