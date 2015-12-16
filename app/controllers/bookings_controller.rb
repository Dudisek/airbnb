class BookingsController < ApplicationController
	before_action :set_booking, only: [:edit, :update, :show]

	def new
		@listing = Listing.find(params[:listing_id])
		@booking = Booking.new
	end

	def create
		@booking = current_user.bookings.new(bookings_params)

		if @booking.save
			redirect_to @booking
		else
			render 'new'
		end
	end

	def edit
		@booking = Booking.find(params[:id])
	end

	def update
		if @booking.update(bookings_params)
			redirect_to @booking
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
	  @booking = Booking.find(params[:id])
	  @booking.destroy
	 
	  redirect_to '/'
	end

private
	def bookings_params
		params.require(:booking).permit(:guests, :check_in, :check_out)
	end

	def set_booking
		@booking = Booking.find(params[:id])
	end
end