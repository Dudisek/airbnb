class UsersController < Clearance::UsersController
	def show
		if authorization? (params[:id])
			@user = User.find(params[:id])
		else
			flash[:alert] = "Not authorizate, you can see just your profile!"
			redirect_to root_url 
		end
	end

	def edit
		if authorization? (params[:id])
			@user = User.find(params[:id])
		else
			flash[:alert] = "Not authorizate"
			redirect_to root_url 
		end
	end

	def update
		if authorization? (params[:id])
			@user = User.find(params[:id])
			if @user.update(user_params)
				redirect_to @user
			else
				flash.now[:error] = "Fix it!"
				render 'edit'
			end
		else
		flash[:alert] = "Not authorizate"
		redirect_to root_url 	
		end	
	end

	# def destroy
	#   @user = User.find(params[:id])
	#   @user.destroy
	 
	#   redirect_to '/'
	# end


private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :birthday, :phone, :about, :picture, :email, :tag_list)
	end

end