class ReservationMailer < ApplicationMailer
	def booking_email(customer, listing, booking)
		@customer = customer
		@listing = listing
		@booking = booking
		byebug		
		mail(to: @listing.user.email, subject: "You have received a booking from #{@customer.first_name}.")
	end
end
