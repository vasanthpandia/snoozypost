class InstalledApp < ActiveRecord::Base
	belongs_to :user , :foreign_key =>'user_id'
	has_many :socialposts
	self.inheritance_column = :provider 

    # We will need a way to know which animals
    # will subclass the Animal model

end
