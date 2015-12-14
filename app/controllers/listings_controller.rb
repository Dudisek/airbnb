class ListingsController < ApplicationController

	def new
	end

	def create
		byebug
		@listing = current_user.listings.new(listing_params)
		@listing.save
  		redirect_to @listing
	end
	
	def show
		@listing = Listing.find(params[:id])
		@user = User.find(@listing.user_id)
	end

	def index
		@listings = Listing.all
	end

	def listing_params
		params.require(:listing).permit(:name, :body, :start, :end, :price, :num_of_guest, :room_type, )
	end
end

