class UsersController < Clearance::UsersController
	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
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