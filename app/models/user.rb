class User < ActiveRecord::Base
	# attr_accessible :name, :email, :password, :password_confirmation
	validates_presence_of :password, on: :create
	validates_presence_of :email
	has_secure_password
	has_many :installed_apps
	has_many :posts
	delegate :linkedin_app, :facebook_app, :twitter_app , :to => :installed_apps
end
