class AdminController < ApplicationController

	before_action :authorize_admin

	def index
		@admin = current_user
	end

	def show
		@users = User.all
		@user = User.find(params[:id])
		if params[:search]
			@search_term = params[:search]
			@users = @users.search_by(@search_term)
		end
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
