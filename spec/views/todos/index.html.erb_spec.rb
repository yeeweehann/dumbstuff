require 'capybara/rspec'
require 'rails_helper'

describe "ensure sign in, sign out, and reach todo page is working", driver: :selenium do
	before :each do
		user = User.create(email: "admin@admin.com", password: "123", password_confirmation: "123", username: "Admin")
		user = User.create(email: "yeeweehann@hotmail.com", password: "123", password_confirmation: "123", username: "KuroiHikari")
		session[:current_user_id] = user.id
		visit(root_path)
		click_link('Sign In')
		fill_in('Email', with: 'yeeweehann@hotmail.com')
		fill_in('Password', with: '123')
		fill_in('Password Confirmation', with: '123')
		click_button('Log In')
		click_button('Show me the money')
		sleep 4
      	within_frame('braintree-hosted-field-number') do
     		fill_in 'credit-card-number', with: '4111-1111-1111-1111'
   		 end

	    within_frame('braintree-hosted-field-expirationDate') do
		    fill_in 'expiration', with: '10/2019'
	    end

	    within_frame('braintree-hosted-field-cvv') do
	    	fill_in 'cvv', with: '123'
	    end
		click_button('Purchase')
		sleep 4
		
	end

	it "create todo, complete todo, delete todo and sign out" do
		user = User.last
		click_link('link')
		click_link('New Todo')
		fill_in('Description', with: 'Punch Myself')
		click_button("Add Todo")
		click_button("Complete")
		click_link("Delete Todo")
		click_link("Sign Out")
		expect(root_path)
	end
end