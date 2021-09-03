class SessionsController < ApplicationController
	layout 'sessions'

	def new
		if session[:user_id]
			redirect_to rooms_path, notice: "Selamat Datang !"
		else
			@user = User.new
		end
	end


	def create
		@user = User.find_by_username params[:user][:username]

		if @user and @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to rooms_path, notice: "Selamat Datang !"
		else
			redirect_to new_session_path, alert: "Username atau Password Salah !"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to new_session_path, notice: 'Anda telah berhasil Logout !'
	end
end
