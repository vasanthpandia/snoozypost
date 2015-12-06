# config/initializers/koala.rb
# Monkey-patch in Facebook config so Koala knows to 
# automatically use Facebook settings from here if none are given
require 'yaml'
module Facebook
  # CONFIG = YAML.load_file(Rails.root.join("config/facebook.yml"))[Rails.env]
  APP_ID = '1573822299559723'
  SECRET = '9934c6df1f735f2bdd82b2c91d6eb85f'
end

Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    case args.size
      when 0, 1
        raise "application id and/or secret are not specified in the config" unless Facebook::APP_ID && Facebook::SECRET
        initialize_without_default_settings(Facebook::APP_ID.to_s, Facebook::SECRET.to_s, args.first)
      when 2, 3
        initialize_without_default_settings(*args) 
    end
  end 

  alias_method_chain :initialize, :default_settings 
end
