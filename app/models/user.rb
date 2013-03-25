class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

	has_many :rides
	
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
end
