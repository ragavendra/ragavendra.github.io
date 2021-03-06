class UsersController < ApplicationController
	
	before_action	:logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action	:correct_user, only: [:edit, :update]
	before_action	:admin_user, only: [:destroy, :edit, :update]
	
	attr_accessor	:name, :email

	def index
		@users = User.paginate(page: params[:page])
	end

  def new
		@user = User.new
  end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save

			#log in
			log_in @user

			#message for success save
			flash[:success] = "Welcome #{@user.name} your account is now created successfully"
			
			#goes to #show action with flash
			redirect_to	@user

		else

			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes (user_params)
			flash[:success] = "#{@user.name} profile updated succesfully"
			redirect_to @user

		else
			render 'edit'
		end
	end

  def show
		@user = User.find(params[:id])
		
		@user
  end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to users_url
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password,
																 :password_confirmation)
	end

	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Please log in"
			redirect_to login_url
		end
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to root_url unless ( current_user?(@user) || current_user.admin? )
	end

	def admin_user
		redirect_to (root_url) unless current_user.admin?
	end

end
