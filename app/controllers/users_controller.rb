class UsersController < ApplicationController

	def index
		@user.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			flash[:notice] = "User ceated successfully"
		end
	end
	def fbauth
		@oauth_token ||= Koala::Facebook::OAuth.new(fbauth_user_url).get_access_token(params[:code]) if params[:code]
		Rails.logger.debug "*"*50
		Rails.logger.debug @oauth_token.inspect
		Rails.logger.debug "*"*50
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
	end
	def update
	end
	def delete
	end
	def destroy
	end
	private
	def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
