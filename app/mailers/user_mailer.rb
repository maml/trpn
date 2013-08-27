require "net/http"
require "json"

class UserMailer

	WELCOME_EMAIL_ID = 10084
	
	class << self

		def launch_welcome_email(user)
			unless Rails.env == "test"
				uri = URI.parse(ENV["EXPRESS_PIGEON_URI"])
				req = Net::HTTP::Post.new uri.path

				body = 
				{
					"template_id" => UserMailer::WELCOME_EMAIL_ID,
					"reply_to"  => "mloseke@gmail.com",
					"from"  => "Matt Loseke",
					"to"  => "mloseke@gmail.com",
					"subject"  => "Welcome to TRPN",
					"merge_fields"  => {
						"first_name"  => "#{user.name}"
					}
				}

				req.body = body.to_json
				req["X-auth-key"] = ENV["EXPRESS_PIGEON_AUTH_KEY"] 
				req["Content-type"] = "application/json"

				res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
					http.request req
				end
			end
		end

	end

end
