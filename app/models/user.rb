class User < ActiveRecord::Base

	has_many :installed_apps
	has_many :posts

	has_secure_password

  delegate :linkedin_app, :facebook_app, :twitter_app , :to => :installed_apps
  
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates :email, uniqueness: true

end

