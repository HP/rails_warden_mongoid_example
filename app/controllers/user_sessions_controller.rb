class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
  end
  
  def create
    authenticate!
    
    if logged_in?
      flash[:notice] = "Login successful!"
      redirect_to account_url
    end
  end
  
  def destroy
    logout
    
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
  
  def unauthenticated
    flash[:error] = "Incorrect email/password combination"
    
    redirect_to new_user_session_url
    return false
  end
end