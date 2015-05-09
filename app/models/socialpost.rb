class Socialpost < ActiveRecord::Base	
	belongs_to :post
	belongs_to :installed_app
end
