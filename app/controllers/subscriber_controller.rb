
class Instagram
  include HTTParty

  def initialize()
    
  end

  # which can be :friends, :user or :public
  # options[:query] can be things like since, since_id, count, etc.
  def subscribe(access_token)
    options= {:client_id => '28b33d3653eb4116a70a8bf3e2c536c8', 
			:client_secret => '4e8a03a7cd5d408dadef8f129f548a6f',
			:object => 'tag',
			:object_id => 'groupergram',
			:aspect => "media",
			:verify_token => access_token,
			:callback_url => "http://gentle-brushlands-2259.herokuapp.com/callback"}
    self.class.post("https://api.instagram.com/v1/subscriptions/", options)
  end

  def post(text)
    options = { :body => {:status => text}, :basic_auth => @auth }
    self.class.post('/statuses/update.json', options)
  end
end

class SubscriberController < ApplicationController

	def sub
		access_token="647314520.28b33d3.3c32e0aee9f740de993d25b0787ae1e2"
		resp = Instagram.new.subscribe(access_token)
		p "response:"
		p resp
		p "end of response"


		render inline: "OK, you have subscribed"
	end

	def unsub
		render inline: "OK you have unsubscribed"
	end

	def callback
		p "entered callback method"
		p params
		render inline: params["hub.challenge"]
	end


end

