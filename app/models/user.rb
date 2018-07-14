class User < ApplicationRecord

	has_secure_password
	has_many :todos, dependent: :destroy
	validates :email, uniqueness: true
	validates :email, :uniqueness=> true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "error"}
	validates :password, :email, :password_confirmation, presence: true, on: [:create]
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	enum role: [:noobie, :whaler, :admin]

end
