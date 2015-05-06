class SessionsController < ApplicationController
  def new
  	@session
  end
  def create
    user=env["warden"].authenticate
    if user 
      puts user.inspect
      redirect_to root_path
     else
      flash.now.alert = env["warden"].message
      render 'new'
     end
  end
  def destroy
  	env["warden"].logout
  	redirect_to  login_path 
  end
end