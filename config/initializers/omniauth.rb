require 'yaml'

module Twitter
  CONFIG = YAML.load_file(Rails.root.join("config/twitter.yml"))[Rails.env]
  API_KEY = CONFIG['api_key']
  SECRET = CONFIG['secret']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Twitter::API_KEY, Twitter::SECRET
end