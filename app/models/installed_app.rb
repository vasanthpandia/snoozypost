class InstalledApp < ActiveRecord::Base
	belongs_to :user , :foreign_key =>'user_id'
	has_many :socialposts
	self.inheritance_column = :provider 

	validates_uniqueness_of :uid

    # We will need a way to know which animals
    # will subclass the Animal model
     def self.provider
      %w(FacebookApp TwitterApp LinkedinApp)
    end
	scope :facebook_app, -> { where(provider: 'FacebookApp') } 
	scope :twitter_app, -> { where(provider: 'TwitterApp') } 
	scope :linkedin_app, -> { where(provider: 'LinkedinApp') }

end

class FacebookApp < InstalledApp; end
class TwitterApp < InstalledApp; end
class LinkedinApp < InstalledApp; end


