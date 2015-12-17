class ReservationMailer < ApplicationMailer
	def booking_email(first_name, host, booking_id)
		@host = host
		@customer = customer
		@booking_id = booking_id
	end
end
