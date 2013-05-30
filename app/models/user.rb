class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
	attr_accessor :salt, :encrypted_password

	has_many :rides

	before_save :encrypt_password
	after_save  :clear_password
	
	# format check for email based on http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/
	validates :email,
		:presence 		=> true,
		:uniqueness 	=> true,
		:format 			=> { :with => /.+@.+\..+/i, :message => 'Please enter a valid email address' }
	validates :password,
		:presence			=> true,
		:confirmation => true,
		:length => { 
			:minimum 		=> 6,
			:maximum 		=> 20,
			:too_short 	=> 'Your password must be at least 6 characters',
			:too_long 	=> 'Your password must be less than 20 characters'
		}
	validates :password_confirmation,
		:presence 		=> true

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
			self.password = self.encrypted_password
		end
	end

	def clear_password
		self.password = nil
	end

	def username
		read_attribute('email').split("@")[0]
	end
end
