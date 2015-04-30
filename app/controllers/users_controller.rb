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
		@oauth = Koala::Facebook::OAuth.new(APP_CONFIG['app_id'],APP_CONFIG['secret_key'],APP_CONFIG['redirect_url'])
		puts @oauth.inspect
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
