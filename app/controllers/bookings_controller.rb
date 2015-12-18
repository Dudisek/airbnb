class BookingsController < ApplicationController
	before_action :set_booking, only: [:edit, :update, :show]

	def new
		@listing = Listing.find(params[:listing_id])
		@client_token = generate_client_token
		@booking = Booking.new
	end

	def create
		@booking = current_user.bookings.new(bookings_params)
		byebug



			@result = Braintree::Transaction.sale(
      		amount: 1,
      		payment_method_nonce: params[:payment_method_nonce])

			if @result.success?
				@booking.save
				# ReservationJob.perform_later(@booking.user, @booking.listing, @booking)
	      		redirect_to @booking, notice: "Congraulations! Your transaction has been successfully!"
				
			else
				flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
	    		client_token = generate_client_token
	      		render :new
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
		params.require(:booking).permit(:guests, :check_in, :check_out, :listing_id, :amount)
	end

	def set_booking
		@booking = Booking.find(params[:id])
	end

	def generate_client_token
	  Braintree::ClientToken.generate
	end


end