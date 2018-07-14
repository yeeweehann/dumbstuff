class AddImageToTodos < ActiveRecord::Migration[5.2]
  	def change
  		add_attachment :todos, :image
	end
end
