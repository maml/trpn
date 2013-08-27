class User < ActiveRecord::Base
	has_secure_password

	validates_uniqueness_of :email
	validates :email, :presence 	=> true,
										:uniqueness => true,
										# format based on http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/
										:format   	=> { :with => /.+@.+\..+/i, :message => 'Please enter a valid email address' }
	validates :password, length: { minimum: 8 }

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

	has_many :rides

	acts_as_messageable

	after_create :send_welcome_email, unless: "test_env?"

	def name
		read_attribute('email').split("@")[0]
	end

	# required for mailboxer so it has an email to which it may send. not currently
	# used but this method needs to return nil
	def mailboxer_email ; end

	private

	def send_welcome_email
		UserMailer.launch_welcome_email(self)
	end

	def test_env?
		Rails.env == "test"
	end

end
