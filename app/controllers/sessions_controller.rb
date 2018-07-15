class SessionsController < ApplicationController

	def new
	end

	def create
		if params[:session][:password] == params[:session][:password_confirmation]
			if @user = User.find_by(email: params[:session][:email])
				if @user.authenticate(params[:session][:password])
					session[:user_id] = @user.id
					if @user.Admin?
						redirect_to admin_index_path
					else
						redirect_to users_path
					end
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
		session.destroy
		redirect_to root_path
	end

end