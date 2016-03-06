# config/initializers/koala.rb
# Monkey-patch in Facebook config so Koala knows to
# automatically use Facebook settings from here if none are given
require 'yaml'
module Facebook
  # CONFIG = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
  APP_ID = Rails.application.secrets.facebook_app_id
  SECRET = Rails.application.secrets.facebook_app_secret
end

Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    case args.size
      when 0, 1
        raise "application id and/or secret are not specified in the config" unless Facebook::APP_ID && Facebook::SECRET
        initialize_without_default_settings(Facebook::APP_ID, Facebook::SECRET, args.first)
      when 2, 3
        initialize_without_default_settings(*args)
    end
  end

  alias_method_chain :initialize, :default_settings
end
