module SessionsHelper

	def log_in user
		#using session var as it expires after a timestamp
		session[:user_id] = user.id
		#current_user
		#debugger
	end

	def current_user
		#assign id if already not, avoid multiple assigns due to reloads
		#find_by_id returns nil whereas only find throw exception if no user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	# Logs out the current user.
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

end
