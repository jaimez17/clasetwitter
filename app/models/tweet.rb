class Tweet < ActiveRecord::Base
	def initialize(params = {})
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = "oo3BXemELJojW0N3z4p5pisPF"
  			config.consumer_secret     = "89rwtzrkp74lz7cNbAVtVB9imy9UCp1j43xrSREfaPZFYJLm4R"
  			config.access_token        = "3022330265-Gp1D0nbRGAbj0Tl6J2dd3xNsjGxieNEzrwF7Y2W"
  			config.access_token_secret = "ZfHHugdKENW3edJt51zwgZRaxwVV7HIXbqilhb3R14KqN"			
		end
		super 	
		end

	def read_message
		return "No hay usuario" if self.user.blank?
		@client.user_timeline(self.user).first.text
	end

	def show_message_by_url
		return "URL no existente" if self.url.blank?
		@client.status(self.url)
	end

	def update_status
		return "No hay status" if self.message.blank?
		@client.update(self.message)
	end

end
