require 'yaml'

module Twitter
  # CONFIG = YAML.load_file(Rails.root.join("config/twitter.yml"))[Rails.env]
  API_KEY = ENV['TWITTER_API_KEY']
  SECRET = ENV['TWITTER_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Twitter::API_KEY, Twitter::SECRET
end