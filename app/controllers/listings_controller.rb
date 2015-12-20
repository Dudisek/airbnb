class ListingsController < ApplicationController

	def new
		@listing = current_user.listings.new
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listing_params)
			redirect_to @listing
		else
			render 'edit'
		end
	end

	def create
		@listing = current_user.listings.new(listing_params)
		@listing.address = @listing.address_formatted_address
		byebug
		if @listing.save
			
			# data = JT::Rails::Address.search("Eiffel Tower", "YOUR GOOGLE API KEY")

			# Use the data retrieve from Google Maps API
			# my_instance.load_address(:address, data)
  			redirect_to @listing
  		else
  			render 'new'
  		end
	end
	
	def show
		@listing = Listing.find(params[:id])
		# @map = JT::Rails::Address.search("#{@listing.address_formatted_address}", "AIzaSyAPnzCJnV5tUuOi2l_s6oSJMGM5H_UR5-c")
		@user = User.find(@listing.user_id)
	end

	def index
		@listings = Listing.all
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to listings_path
	end

	def tagged
	  if params[:tag].present? 
	    @listings = List.tagged_with(params[:tag])
	  else 
	    @listings = List.postall
	  end
	end

private     
	def listing_params
		params.require(:listing).permit(:name, :body, :start, :end, :price, :num_of_guest, :room_type, :tag_list, :address, :address_formatted_address, :address_street_number, :address_street_name, :address_street, :address_city, :address_zip_code, :address_department, :address_department_code, :address_state, :address_state_code, :address_country, :address_country_code, :address_lat, :address_lng, {picture: []})
	end 
end

