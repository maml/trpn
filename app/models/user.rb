class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

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
