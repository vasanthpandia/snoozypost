class ProfileController < ApplicationController
  before_filter :ensure_signed_in, only: [:edit, :update]
  before_filter :get_user

  def show
    @user
  end

  def edit

  end

  def update

  end

  private

  def get_user
    @user ||= current_user
  end
end
