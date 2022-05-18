class UsersController < ApplicationController

    require 'rspotify/oauth' 

    def spotify

        @allLsts= Lst.all #playlists that have already been searched/stored
        #a somewhat wasteful way to make last requested playlist persist

        if @allLsts.size > 0
            
            @recent = RSpotify::Playlist.find_by_id(@allLsts[@allLsts.size - 1].spotify_id)
            @recent_tracks = @recent.tracks.sort_by {|t| t.popularity}
            
            puts "There are #{@allLsts.size} playlists (spotify)."
        end 

        #creates a new user object
        @spotify_user = RSpotify::User.new(request.env['omniauth.auth']) 

        #this method of hashing the user is slightly different than the rspotify documentation,
        #was inspired by the user_controller.rb file of a project found at https://github.com/robynwang314/Project/blob/master/app/controllers/users_controller.rb 
        session[:spotify_user_hash] = @spotify_user.to_hash

        @playlists = @spotify_user.playlists #i don't think we actually need this variable lol

    
    end 

    def createArt

        @playlist = params[:playlistInput]

        @spotify_user = RSpotify::User.new(session[:spotify_user_hash]) #uses previous hash to retrieve user
        
        @id = @playlist.slice!(0) #id number sliced off playlist name (had been added to html dropdown for indexing)
    
        @pl = @spotify_user.playlists[@id.to_i] #id is used to grab playlist 

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
