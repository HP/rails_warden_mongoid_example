# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  
  private
    def require_user
      unless current_user
        flash[:notice] = "You must be logged in to access that page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        flash[:notice] = "You must be logged out to access that page"
        redirect_to account_url
        return false
      end
    end
end
