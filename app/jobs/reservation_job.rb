class ReservationJob < ActiveJob::Base

	queue_as :default
	def perform(customer, listing, booking)	
		ReservationMailer.booking_email(customer, listing, booking).deliver_now
	end
end






