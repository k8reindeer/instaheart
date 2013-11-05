class SubscriberController < ApplicationController

	def sub
		render inline: "OK, you have subscribed"
	end

	def unsub
		render inline: "OK you have unsubscribed"
	end


end
