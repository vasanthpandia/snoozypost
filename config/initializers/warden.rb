Rails.application.config.middleware.use Warden::Manager do |manager|
	manager.default_strategies(:password)
end

Warden::Manager.serialize_into_session do |user|
	user.id
end

Warden::Manager.serialize_from_session do |id|
	User.find(id)
end

Warden::Strategies.add(:password) do
	def authenticate!
		user = User.find_by_email(params["session"]["email"])
		Rails.logger.debug "*"*50
		Rails.logger.debug params.inspect
		Rails.logger.debug "*"*50
		puts user.inspect
		if user && user.authenticate(params["session"]["password"])
			success! user
		else
			puts user.inspect
			fail "Invalid username and password"
		end
	end
end