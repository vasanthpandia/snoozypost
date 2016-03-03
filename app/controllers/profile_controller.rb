class ProfileController < ApplicationController
  before_filter :ensure_signed_in, only: [:edit, :update]
  before_filter :get_user, only: [:show, :edit]

  def show
    @user
  end

  def edit

  end

  def update

  end

  private

  def get_user
    @user ||= User.find(params[:id])
  end
end
