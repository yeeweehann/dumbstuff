# require 'rails_helper'

# RSpec.describe TodosController, type: :controller do
# 	let(:valid_create_params) {{ email: "yeeweehann@hotmail.com", password: "123", password_confirmation: "123", username: "KuroiHikari" }}

# 	it "does not load todo page if user is Noobie" do
# 		user = User.create(valid_create_params)
# 		session[:current_user_id] = user.id
# 		get :index
# 		expect(response).to redirect_to(users_path)
# 	end

# 	it "does not load new todo page if user is Noobie" do
# 		user = User.create(valid_create_params)
# 		session[:current_user_id] = user.id
# 		get :new
# 		expect(response).to redirect_to(users_path)
# 	end

# 	it "loads todo page if user is Whaler" do
# 		user = User.create(valid_create_params)
# 		session[:current_user_id] = user.id
# 		user.update!(role: "Whaler")
# 		get :index
# 		expect(response).to have_http_status(:success)
# 	end

# 	it "loads new todo page if user is Whaler" do
# 		user = User.create(valid_create_params)
# 		session[:current_user_id] = user.id
# 		user.update!(role: "Whaler")
# 		get :new
# 		expect(response).to have_http_status(:success)
# 	end

# 	it "loads todo page if user is Admin" do
# 		user = User.create(valid_create_params)
# 		session[:current_user_id] = user.id
# 		user.update!(role: "Admin")
# 		get :index
# 		expect(response).to have_http_status(:success)
# 	end

# 	it "loads new todo page if user is Admin" do
# 		user = User.create(valid_create_params)
# 		session[:current_user_id] = user.id
# 		user.update!(role: "Admin")
# 		get :new
# 		expect(response).to have_http_status(:success)
# 	end

# 	describe "POST #create" do
# 		context "create todo" do
# 			it "create todo" do
# 				user = User.create(valid_create_params)
# 				todo = user.todos.create(description: "Punch myself")
# 				expect(Todo.count).to eq(1)
# 			end

# 			it "redirects to show user path after creating todo" do
# 				user = User.create(valid_create_params)
# 				session[:current_user_id] = user.id
# 				post :create, params: {todo: {description: "Punch myself"}}
# 				expect(response).to redirect_to user_todos_path(user)
# 			end
# 		end
# 	end

# 	describe "DELETE #destroy" do
# 		context "deleting todo" do
# 			it "deletes todo" do
# 				user = User.create(valid_create_params)
# 				session[:current_user_id] = user.id
# 				todo = user.todos.create(description: "Punch myself")
# 				expect { delete :destroy, params: {id: todo.id} }.to change(Todo, :count).by(-1)
# 			end

# 			it "redirect to user's path after deleting todo" do
# 				user = User.create(valid_create_params)
# 				session[:current_user_id] = user.id
# 				todo = user.todos.create(description: "qwerty")
# 				delete :destroy, params: { id: todo.id }
# 				expect(response).to redirect_to user_todos_path(user)
# 			end
# 		end
# 	end
# end