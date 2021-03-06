class SubscriptionMailer < ActionMailer::Base
  default from: "notifications@trpn.me"

	def launch_notification_email(subscription)
		unless Rails.env == "development"
			@subscription = subscription
			@url = "http://trpn.me"
			mail(:to => subscription.email, :subject => "Welcome to TRPN's launch notification list!")
		end
	end
end
