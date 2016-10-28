class ProfileController < ApplicationController
  before_filter :ensure_signed_in, only: [:show, :edit, :update]
  before_filter :get_user

  def show
    @user
  end

  def edit
    @user
  end

  def update
    @user.update(user_params)
  end

  private

  def get_user
    @user ||= current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
