class AdminController < ApplicationController

	before_action :authorize_admin

	def index
		@admin = 1

	end

	def show
		@users = User.all
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:user_id])
			if @user.destroy
			redirect_to admin_path(current_user)
		else
			redirect_to admin_path(current_user)
		end
	end

end
