class AuthorizationsController < ApplicationController
	def fbauth
		@access_token = Koala::Facebook::OAuth.new(fbauth_authorization_url).get_access_token(params[:code]) if params[:code]
		@graph = Koala::Facebook::API.new(@access_token)
		@uid = OpenStruct.new(@graph.get_object('me')).id
		Rails.logger.debug "*"*50
		Rails.logger.debug @access_token
		Rails.logger.debug @provider
		Rails.logger.debug "*"*50
		current_user.installed_apps << FacebookApp.new(access_token: @access_token, uid: @uid)
		redirect_to root_path
		
	end
	def twitterauth
		# raise env['omniauth.auth'].to_yaml
		@access_token = env['omniauth.auth']['credentials']['token']
		@uid = env['omniauth.auth']['uid']
		Rails.logger.debug "*"*50
		Rails.logger.debug @access_token
		Rails.logger.debug @uid
		# Rails.logger.debug @provider
		Rails.logger.debug "*"*50
		current_user.installed_apps << TwitterApp.new(access_token: @access_token, uid: @uid)
		redirect_to root_path
	end
end
