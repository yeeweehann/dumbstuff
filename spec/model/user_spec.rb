require 'rails_helper'

RSpec.describe User, type: :model do
	context "validations" do

		it "should have email column with string" do
			should have_db_column(:email).of_type(:string)
		end

		it "should have password_digest column with string" do
			should have_db_column(:password_digest).of_type(:string)
		end

		it "should have position column with integer" do
			should have_db_column(:role).of_type(:integer).with_options(default: "Noobie")
		end
	end

	context "format" do
		user = User.new
		it { expect(user).to allow_value("yeeweehann@hotmail.com").for(:email) }
		it { expect(user).to_not allow_value("qwerty").for(:email) }
		it { expect(user).to validate_presence_of(:email) }
	end

	context "associations" do
		user = User.new
		it { expect(user).to have_many(:todos).dependent(:destroy) }
	end

end