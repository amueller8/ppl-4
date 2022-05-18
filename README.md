# Spotify Playlist Popularity Ranker 

This project uses the RSpotify gem in order to access the Spotify API! 
It is ruby version 3.1.2.

## Getting started/configuration
To get started...
Check out the config folder.
Look in the omniauth.rb file and replace where it says `<client_id>` and `<client_secret>` with your client ID and secret (you get these from creating an app in the Spotify Developer site).
Do the same thing in the application.rb file.

To configure, you may need to run `bundle install` to access the rspotify gem.
To create the database, run `bundle exec db:migrate`.

## Weird Quirks 
There are a few quirks of this app, partly due to the playlist request page also being the page where the playlist rank gets displayed! This causes an OAuth cross-origin reference error (rip). You just need to re-go back to localhost:3000/auth/spotify page to see the playlist ranking-- sorry :)
Also, the most recent playlist searched gets loaded upon accessing localhost:3000/auth/spotify, so you will see a playlist ranking upon loading if you have ever used the app before without clearing database despite maybe not having searched in that moment.

(To clear database, run `rake db:migrate db:reset`).


##Images

<img width="598" alt="Screen Shot 2022-05-18 at 10 05 55 AM" src="https://user-images.githubusercontent.com/68559641/169060882-84caf1d7-420b-4e64-bd4f-e51c421dae05.png">
<img width="563" alt="Screen Shot 2022-05-18 at 10 06 47 AM" src="https://user-images.githubusercontent.com/68559641/169061077-7a543b6a-232f-47c8-aa25-ba820235a6f9.png">
<img width="490" alt="Screen Shot 2022-05-18 at 10 07 08 AM" src="https://user-images.githubusercontent.com/68559641/169061146-2eba038d-7128-4a1b-8f24-3b84cc1bf607.png">


[playlist popularity ranker.pdf](https://github.com/amueller8/ppl-4/files/8716915/playlist.popularity.ranker.pdf)
