class UsersController < Clearance::UsersController
	before_action :user_authorization, only: [:show, :edit, :update]

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
			flash[:alert] = @user.errors.full_messages.first
			render 'edit'
		end
	end

private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :birthday, :phone, :about, :picture, :email, :tag_list)
	end

	def user_authorization
		if authorization? (params[:id])
			@user = User.find(params[:id])
		else
			flash[:alert] = "No Authorizate"
			redirect_to root_url
		end
	end
end	