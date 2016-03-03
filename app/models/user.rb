class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :installed_apps
	has_many :posts

  delegate :linkedin_app, :facebook_app, :twitter_app , :to => :installed_apps

  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

end

