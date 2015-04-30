require 'yaml'
APP_CONFIG = YAML.load_file("#{Rails.root}/config/facebook.yml")[Rails.env]