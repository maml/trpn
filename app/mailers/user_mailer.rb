require "net/http"
require "json"

class UserMailer

	WELCOME_EMAIL_ID = 10084
	PASSWORD_RESET_ID = 10648

	EXPRESS_PIGEON_URI = URI.parse(ENV["EXPRESS_PIGEON_URI"])
	REQUEST = Net::HTTP::Post.new UserMailer::EXPRESS_PIGEON_URI.path
	
	class << self

		def mail(user, opts={})
			uri = UserMailer::EXPRESS_PIGEON_URI
			req = UserMailer::REQUEST
			
			body = opts
			
			req.body = body.to_json
			req["X-auth-key"] = ENV["EXPRESS_PIGEON_AUTH_KEY"] 
			req["Content-type"] = "application/json"

			res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
				http.request req
			end
		end

		def launch_welcome_email(user)
			body = 
			{
				template_id: UserMailer::WELCOME_EMAIL_ID,
				reply_to: "mloseke@gmail.com",
				from: "TRPN HQ",
				to:  "mloseke@gmail.com",
				subject: "Welcome to TRPN",
				merge_fields: {
					first_name: "#{user.name}"
				}
			}
			mail(user, body)
		end

		def password_reset(user)
			body = 
			{
				"template_id" => UserMailer::PASSWORD_RESET_ID,
				"reply_to"  => "mloseke@gmail.com",
				"from"  => "Matt Loseke",
				"to"  => "mloseke@gmail.com",
				"subject"  => "Password reset instructions",
				"merge_fields"  => {
					"password_reset_url"  => "#{Trpn::Application.config.mailer_uri}#{Rails.application.routes.url_helpers.edit_password_reset_url(user.password_reset_token, :only_path => true)}"
				}
			}
			mail(user, body)
		end

	end

end
