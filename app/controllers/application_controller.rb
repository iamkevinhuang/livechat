class ApplicationController < ActionController::Base

	protected
		def login_required 

			unless session[:user_id] 
				redirect_to new_session_path, alert: 'Mohon login terlebih dahulu !'
			else
				@current_user = User.find session[:user_id]
			end
		end
end
