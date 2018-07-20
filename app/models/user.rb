class User < ApplicationRecord

	has_secure_password
	has_many :todos, dependent: :destroy
	validates :email, uniqueness: true
	validates :email, :uniqueness=> true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "error"}
	validates :password, :email, :password_confirmation, presence: true, on: [:create]
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	enum role: [:Noobie, :Whaler, :Admin]
	before_create { generate_token(:auth_token) }

	def self.search_by(search_term)
		where("LOWER(username) LIKE :search_term OR LOWER(email) LIKE :search_term", search_term: "%#{search_term.downcase}%")
	end

	def generate_token(column)
	    begin
	      self[column] = SecureRandom.urlsafe_base64
	    end while User.exists?(column => self[column])
	end
end
