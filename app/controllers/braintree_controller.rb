class BraintreeController < ApplicationController
  	def new
 	 	@client_token = Braintree::ClientToken.generate
	end

	def checkout
		nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

		result = Braintree::Transaction.sale(
		   	:amount => "10.00", #this is currently hardcoded
		   	:payment_method_nonce => nonce_from_the_client,
		   	:options => {
		     	:submit_for_settlement => true
		    }
		)

		if result.success?
			current_user.Whaler!
		    redirect_to users_path, :flash => { :success => "Thanks for the money!" }
		else
		    redirect_to :root, :flash => { :error => "Are you kidding me? Please get out if you have no money" }
		end
	end
end
