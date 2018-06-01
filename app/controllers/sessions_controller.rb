class SessionsController < ApplicationController
 	def show
  	end
	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id

			flash[:success] = "Welcome to InSpecIT Inc."
			redirect_to root_path
		else
			flash.now[:danger] = "Your email or password is incorrect!"
			render 'show'
		end
	end
	def out
		session[:user_id] = nil
		flash[:success] = "Signing out!"
		redirect_to root_path
	end
end
