require 'rails_helper'

RSpec.describe Todo, type: :model do
	context "validations" do
		it "description is string" do
			should have_db_column(:description).of_type(:string)
		end

		it "status is integer" do
			should have_db_column(:status).of_type(:integer).with_options(default: "Incomplete")
		end
	end

	context "format" do
		todo = Todo.new
		it { expect(todo).to validate_presence_of(:description) }
	end

	context "associations" do
		todo = Todo.new
		it { expect(todo).to belong_to(:user) }
	end

	context "todo status change" do
		it "changes todo status to Complete" do
			user = User.create(email: "yeeweehann@hotmail.com", password: "123", password_confirmation: "123", username: "KuroiHikari")
			todo = user.todos.create(description: "Punch myself")
			todo.Complete!
			expect(Todo.last.status).to eq("Complete")
		end
	end
end