class SubscriptionMailer < ActionMailer::Base
  default from: "notifications@trpn.me"

	def launch_notification_email(subscription)
		puts "!!!\nlaunch_notification_email called\n!!!"
		puts "subscription: #{subscription.inspect}"
		puts "$RACK_ENV is #{$RACK_ENV}"
		puts "$RACK_ENV is #{$RACK_ENV.inspect}"
		if $RACK_ENV == 'production'
			@subscription = subscription
			@url = "http://trpn.me"
			mail(:to => subscription.email, :subject => "Welcome to TRPN's launch notification list!")
		end
	end
end
