class UserMailer < ActionMailer::Base
	default from: "notifications@staging.trpn.me"

	def launch_welcome_email(user)
		unless Rails.env == "development"
			@url = "http://trpn.me"
			mail(:to => user.email, :subject => "Welcome to TRPN!", :body => "You have signed up with #{user.email}")
		end	
	end

end
