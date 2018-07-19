class SessionsController < ApplicationController

	def new
	end

	def create
		if params[:session][:password] == params[:session][:password_confirmation]
			if @user = User.find_by(email: params[:session][:email])
				if @user.authenticate(params[:session][:password])
					if params[:remember_me]
      					cookies.permanent[:auth_token] = @user.auth_token
    				else
      					cookies[:auth_token] = @user.auth_token  
    				end
					redirect_to users_path
				else
					render 'new'
				end
			else
				render 'new'
			end
		else
			render 'new'
		end	

	end


	def destroy
		cookies.delete(:auth_token)
		redirect_to root_path
	end

end