require 'yaml'

module Twitter
  # CONFIG = YAML.load_file(Rails.root.join("config/twitter.yml"))[Rails.env]
  API_KEY = 'JI6S08yaB0NlaKkWjeV3KAejm'
  SECRET = 'hq8VmDsB7l8b1bWAUcFaozzdErtB8JXcrJIqDhAIQt6JBaSOs9'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Twitter::API_KEY, Twitter::SECRET
end