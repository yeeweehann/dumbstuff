class TodosController < ApplicationController

	before_action :authorized

	def index
		@user = User.find(params[:user_id])
		@todo = Todo.order(:id)
	end

	def new
		@todo = Todo.new
	end

	def create
		@user = User.find(params[:user_id])
		@todo = current_user.todos.new(todo_params)
		if @todo.save
			redirect_to user_todos_path
		else
			render 'new'
		end
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update(edit_todo_params)
			redirect_to user_todos_path
		end
	end

	def destroy
		@todo = Todo.find(params[:id])
		if @todo.user_id == current_user.id
			@todo.destroy
			redirect_to user_todos_path
		else
			redirect_to user_todos_path
		end
	end

	private

	def todo_params
		params.require(:todo).permit(:description, :image)	
	end

	def edit_todo_params
		params.permit(:status)
	end
end

