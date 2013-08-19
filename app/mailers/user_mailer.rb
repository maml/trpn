require 'net/http'
require 'json'

class UserMailer
	
	class << self
		def launch_welcome_email(user)
			uri = URI.parse('https://api.expresspigeon.com/messages')
			req = Net::HTTP::Post.new uri.path

			body = 
			{
				"template_id" => 10084,
				"reply_to"  => "mloseke@gmail.com",
				"from"  => "Matt Loseke",
				"to"  => "mloseke@gmail.com",
				"subject"  => "Welcome to TRPN",
				"merge_fields"  => {
					"first_name"  => "#{user.name}"
				}
			}

			req.body = body.to_json
			# using sandbox auth key . . .
			req['X-auth-key'] = '0edc7843-84fb-4e84-a621-9e617597e27d'
			req['Content-type'] = 'application/json'

			res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
				http.request req
			end

			puts "!!!\n\n"
			puts res.body
			
		end
	end

end
