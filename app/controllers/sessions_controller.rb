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

		#Create account
		#User.create(gName: params[:gName], lName: [:lName], email: params[:email], password: params[:password])

		#Delete account
		# u = User.find_by(email: params[:email])
		# u.authenticate(password: params[:password])
		# u.destroy
	end

	def out
		session[:user_id] = nil
		flash[:success] = "Signing out!"
		redirect_to root_path
	end
end