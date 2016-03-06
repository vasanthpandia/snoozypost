class InstalledApp < ActiveRecord::Base
	self.inheritance_column = :provider

  belongs_to :user

  has_many :socialposts

	scope :facebook_app, -> { where(provider: 'FacebookApp') }
	scope :twitter_app, -> { where(provider: 'TwitterApp') }
	scope :linkedin_app, -> { where(provider: 'LinkedinApp') }

  def self.provider
    %w(FacebookApp TwitterApp LinkedinApp)
  end

  validates :uid, uniqueness: true

end

class FacebookApp < InstalledApp; end
class TwitterApp < InstalledApp; end
class LinkedinApp < InstalledApp; end


