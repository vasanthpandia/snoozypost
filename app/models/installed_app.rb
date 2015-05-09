class InstalledApp < ActiveRecord::Base
	belongs_to :user , :foreign_key =>'user_id'
	has_many :socialposts
end
