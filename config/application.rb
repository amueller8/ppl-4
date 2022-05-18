require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PPLApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    

    RSpotify::authenticate("<client_id>", "<client_secret>")

    #this version inspired by robynwang314 on github, to avoid hardcoding keys
    #=begin RSpotify::authenticate(
      #ENV["SPOTIFY_CLIENT_ID"], 
      #ENV["SPOTIFY_CLIENT_SECRET"]
    #) =end
  end
end
