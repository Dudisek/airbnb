class BookingsController < ApplicationController
	before_action :set_booking, only: [:edit, :update, :show]

	def new
		@listing = Listing.find(params[:listing_id])
		@client_token = generate_client_token
		@booking = Booking.new
		@booking.listing_id = @listing.id
	end

	def create
		@booking = current_user.bookings.new(bookings_params)
		@booking.amount *= (@booking.check_out.to_date - @booking.check_in.to_date).to_i
		if @booking.valid?
			result = Braintree::Transaction.sale(
	  		amount: @booking.amount.to_i,
	  		payment_method_nonce: params[:payment_method_nonce])
			if result.success?
				@booking.save
				# EMAIL
				# ReservationJob.perform_later(customer: @booking.user, listing: @booking.listing, booking: @booking, header: "booking")
      	redirect_to @booking, notice: "Congraulations! Your transaction has been successfully!" and return
	  	end
	  end
	  flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
	  client_token = generate_client_token
	  render 'new'

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
		@booking = Booking.find(params[:id])
		if authorization? (@booking.user.id)
		else
		flash[:alert] = "Not authorizate"
		redirect_to root_url 	
		end
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