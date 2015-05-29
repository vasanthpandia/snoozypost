class UsersController < ApplicationController

	def index
		@user.all
	end
	def new
		@user = User.new
	end
	def show
		@user = User.find(params[:id])
	end
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			flash[:notice] = "User ceated successfully"
		end
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
