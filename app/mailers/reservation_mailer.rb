class ReservationMailer < ApplicationMailer
	def booking_email(customer, listing, booking)
		@customer = customer
		@listing = listing
		@booking = booking	
		mail(to: @listing.user.email, subject: "[AirBnB] You have received a booking from #{@customer.first_name}.")
	end

	def message_email(sender, subject, message, listing)
		@sender = sender
		@subject = subject
		@message = message			
		@listing = listing
		mail(to: @listing.user.email, subject: "[AirBnB message] #{@subject}.")
	end
end
