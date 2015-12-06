class Socialpost < ActiveRecord::Base	

	belongs_to :post
	belongs_to :installed_app

  def app_type
    installed_app.provider
  end

	def mark_as_posted!
		update(posted_at: DateTime.now)
	end
  
end
