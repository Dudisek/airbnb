class ListingsController < ApplicationController

	before_action :find_listing, only: [:edit, :update, :show, :destroy]

	def new
		@listing = current_user.listings.new
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			redirect_to @listing
		else
			render 'edit'
		end
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
  		redirect_to @listing
		else
			render 'new'
		end
	end
	
	def show
		gon.lat = @listing.address_lat
		gon.lng = @listing.address_lng
		@user = User.find(@listing.user_id)
	end

	def index
		tag_or_search_params
		@listings = Listing.paginate(:page => params[:page], per_page: 4).order('created_at DESC')
	end

	def destroy
		@listing.destroy
		redirect_to listings_path
	end

	def send_email
		@listing = Listing.find(params[:listing])
		@subject = params[:subject]
		@message = params[:message]
		@sender = User.find(params[:sender])
		send_email
	end

private
	def listing_params
		params.require(:listing).permit(:name, :body, :start, :end, :price, :num_of_guest, :room_type, :tag_list, :address, :address_formatted_address, :address_street_number, :address_street_name, :address_street, :address_city, :address_zip_code, :address_department, :address_department_code, :address_state, :address_state_code, :address_country, :address_country_code, :address_lat, :address_lng, {picture: []})
	end 

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def send_email
		if ReservationJob.perform_later({subject: @subject, message: @message, sender: @sender, listing: @listing, header: "message"})
			flash[:notice] = "Your message was sent. Thank you."
			redirect_to listings_path(@listing)
		else
			flash[:alert] = "Something went wrong..."
			redirect_to root_url
		end
	end

	def tag_or_search_params
		if params[:tag].present?
			@tag_name = params[:tag]
			@listing_tags = Listing.tagged_with(params[:tag])
		elsif params[:search].present?
			objects = Listing.search(params[:search]).map(&:id) + Listing.near((params[:search]), 50, order: "distance").map(&:id)
			@listings_near = Listing.where(id: objects.uniq)
			# @listings_near = Listing.search(params[:search])  # SEARCH BY ELASTIC SEARCH
			# @listings_near = Listing.near(params[:search], 50, order: "distance") # SEARCH BY DISTANCE
		end
	end

end

