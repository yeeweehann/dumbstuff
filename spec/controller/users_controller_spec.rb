# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
# 	let(:valid_create_params) {{ email: "yeeweehann@hotmail.com", password: "123", password_confirmation: "123", username: "KuroiHikari" }}
# 	let(:invalid_create_params) {{ email: "qwerty", password: "qwerty", password_confirmation: "qwerty" }}
# 	let(:valid_update_params) {{ email: "yeeweehann@hotmail.com", password: "123", password_confirmation: "qweqweqweqwe" }}

# 	it "loads sign up page" do
# 		get :new
# 		expect(response).to have_http_status(:success)
# 	end

# 	it "loads edit user page" do
# 		get :edit, params: { id: 1 }
# 		expect(response).to have_http_status(:success)
# 	end

# 	it "loads user main page" do
# 		get :index
# 		expect(response).to have_http_status(:success)
# 	end

# 	it "loads show profile page" do
# 		get :show, params: { id: 1 }
# 		expect(response).to have_http_status(:success)
# 	end

# 	describe "POST #create" do
# 		context "valid_create_params" do
# 			it "able to sign up" do
# 				expect { post :create, params: {user: valid_create_params} }.to change(User, :count).by(1)
# 			end

# 			it "redirect after sign up" do
# 				post :create, params: {user: valid_create_params}
# 				expect(response).to redirect_to(users_path)
# 			end
# 		end

# 		context "invalid_create_params" do
# 			it "fail to sign up" do
# 				expect { post :create, params: {user: invalid_create_params} }.to change(User, :count).by(0)
# 			end

# 			it "renders create page again after failing" do
# 				post :create, params: {user: invalid_create_params}
# 				expect(response).to render_template('new')
# 			end
# 		end
# 	end

# 	describe "POST #update" do
# 		context "valid_update_params" do
# 			it "updates user info" do
# 				user = User.create(valid_create_params)
# 				user.update!(valid_update_params)
# 				expect(user.email).to eq(valid_update_params[:email])
# 				expect(user.password).to eq(valid_update_params[:password])
# 				expect(user.password_confirmation).to eq(valid_update_params[:password_confirmation])
# 			end

# 			it "redirects to user's page after updating" do
# 				user = User.create(valid_create_params)
# 				session[:current_user_id] = user.id
# 				post :update, params: {user: valid_update_params, id: user.id}
# 				expect(response).to redirect_to user_path(user)
# 			end
# 		end
# 	end
# end