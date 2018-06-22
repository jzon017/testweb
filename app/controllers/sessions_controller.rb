class SessionsController < ApplicationController
 	def show
  	end

	def create
		user = User.find_by(email: params[:email])

		 if user && user.authenticate(params[:password])
		 	if  User.find_by(email: params[:email]).email != "admin@example.com"
		 		session[:user_id] = user.id
		 		redirect_to dtrmain_path
		 	else
		 		session[:user_id] = user.id
		 		redirect_to dtr_output_path
		 	end
		 else
		 	flash.now[:danger] = "Your email or password is incorrect!"
		 	render 'show'
		 end

		
		#Delete account
		# u = User.find_by(email: params[:email])
		# u.authenticate(password: params[:password])
		# u.destroy
	end

	def out
		reset_session
		redirect_to signin_path
	end
end