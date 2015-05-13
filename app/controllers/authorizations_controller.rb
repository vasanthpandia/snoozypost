class AuthorizationsController < ApplicationController
	def fbauth
		@provider = "facebook"
		@access_token = Koala::Facebook::OAuth.new(fbauth_authorization_url).get_access_token(params[:code]) if params[:code]
		@user = current_user
		@graph = Koala::Facebook::API.new(@access_token)
		@uid = OpenStruct.new(@graph.get_object('me')).id
		Rails.logger.debug "*"*50
		Rails.logger.debug @access_token
		Rails.logger.debug @provider
		Rails.logger.debug "*"*50
		@app = InstalledApp.new(user: @user, provider: @provider, access_token: @access_token, uid: @uid)
		if @app.save
			redirect_to root_path
		else
			redirect_to user_path
		end
	end
	def twitterauth
		raise env['omniauth.auth'].to_yaml
	end
end
