class ApplicationController < ActionController::Base

	def signed_in?
       !current_user.nil?
    end

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	helper_method :current_user

	def authorize_admin
		redirect_to users_path, alert: "GET OUT!!!" if current_user.noobie? || current_user.whaler?
	end

end
