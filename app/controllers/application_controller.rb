class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_signed_in
    if !signed_in?
      flash[:alert] = "You must be logged in to view this page"
      redirect_to new_user_session_path if !signed_in?
    end
  end
end
