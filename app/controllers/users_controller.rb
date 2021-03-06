class UsersController < ApplicationController

	def index	
		@user = current_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			if @user.id == 1
				@user.Admin!
				cookies[:auth_token] = @user.auth_token
				redirect_to admin_index_path
			else
				cookies[:auth_token] = @user.auth_token
				redirect_to users_path
			end
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
		if current_user.role != "Admin"	
			if @user.id != current_user.id
				redirect_to users_path
			end
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			if @user.Admin?
				redirect_to admin_index_path
			else
				redirect_to user_path
			end
		else
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :username, :avatar)
	end

	
end