class ReservationJob < ActiveJob::Base

	queue_as :default

	def perform(args = {})
		byebug
		@header = args[:header]
		@customer = args[:customer]
		@listing = args[:listing]
		@booking = args[:booking]
		@subject = args[:subject]
		@sender = args[:sender]
		@message = args[:message]
	
		if @header == "booking"
		ReservationMailer.booking_email(@customer, @listing, @booking).deliver_now

		elsif @header == "message"
			byebug
		ReservationMailer.message_email(@sender, @subject, @message, @listing).deliver_now
		end
	end
end






