module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Errachidia Pharmacy"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user?(user)
		user == current_user
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def store_location
		session[:forwarding_url] = request.original_url if request.get?
	end
end
