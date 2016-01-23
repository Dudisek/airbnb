class BookingsController < ApplicationController
	before_action :set_booking, only: [:edit, :update, :show, :destroy]

	def new
		@listing = Listing.find(params[:listing_id])
		@client_token = generate_client_token
		@booking = Booking.new
		@booking.listing_id = @listing.id
	end

	def create
		@booking = current_user.bookings.new(bookings_params)
		@booking.valid? ? transaction_process : flash[:alert] = @booking.errors.full_messages.first
		if flash[:notice].present?
			redirect_to @booking
		else
			client_token = generate_client_token
			@listing = Listing.find(@booking.listing_id)
			redirect_to(:back)
		end
	end

	def edit
	end

	def update
		if @booking.update(bookings_params)
			redirect_to @booking
		else
			flash[:alert] = @booking.errors.full_messages.first
			render 'edit'
		end
	end

	def show
		if authorization? (@booking.user.id)
		else
			flash[:alert] = "Not authorizate"
			redirect_to root_url  
		end
	end

	def destroy
		@booking.destroy
		flash[:notice] = "Your booking was cancelled."
		redirect_to root_url
	end


private
	def bookings_params
		params.require(:booking).permit(:guests, :check_in, :check_out, :listing_id, :amount)
	end

	def transaction_process
		calculate_amount
		result = Braintree::Transaction.sale(
			amount: @booking.amount,
			payment_method_nonce: params[:payment_method_nonce])
		if result.success?
			@booking.save
			ReservationJob.perform_later(customer: @booking.user, listing: @booking.listing, booking: @booking, header: "booking")
			flash[:notice] = "Congraulations! Your transaction has been successfully!"
		else
			flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
		end
	end

	def calculate_amount
		@booking.amount *= (@booking.check_out.to_date - @booking.check_in.to_date).to_i
	end

	def set_booking
		@booking = Booking.find(params[:id])
	end

	def generate_client_token
		Braintree::ClientToken.generate
	end

end