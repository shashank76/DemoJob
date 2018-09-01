class ApplicationController < ActionController::Base

	helper_method :current_user

    def current_user
  	  current_user ||= User.find_by(id: cookies.signed[:user_id]) if cookies.signed[:user_id]
    end

    def require_user
  		redirect_to new_session_path unless current_user.present?		
    end
end
