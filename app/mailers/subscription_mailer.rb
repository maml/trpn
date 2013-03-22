class SubscriptionMailer < ActionMailer::Base
  default from: "notifications@trpn.me"

	def launch_notification_email(subscription)
		puts "!!!\nlaunch_notification_email called\n!!!"
		puts "subscription: #{subscription.inspect}"
		if $RACK_ENV == 'production'
			puts "$RACK_ENV is production"
			@subscription = subscription
			@url = "http://trpn.me"
			mail(:to => subscription.email, :subject => "Welcome to TRPN's launch notification list!")
		end
	end
end
