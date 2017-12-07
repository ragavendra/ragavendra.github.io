class UsersController < ApplicationController
	
	attr_accessor	:name, :email

  def new
		@user = User.new
  end

	def create
		@user = User.new(user_params)
		if @user.save

			#find if user save success
			@message = "User created successfully" if User.find_by_email(@user.email)
			
			redirect_to	@user
		else
			render 'new'
		end
	end

  def show
		@user = User.find(params[:id])
		
			@message = "User created successfully" if User.find_by_email(@user.email)
		#return message for success save
		return @user, @message
  end

	private

	def user_params
		params[:id]
		params.require(:user).permit(:name, :email, :password,
																 :password_confirmation)
	end

end
