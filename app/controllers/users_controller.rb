class UsersController < ApplicationController
	
	attr_accessor	:name, :email

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

	private

	def user_params
		params[:id]
		params.require(:user).permit(:name, :email, :password,
																 :password_confirmation)
	end

end
