class EmployeesController < ApplicationController
	def dtr
	end		
	def create
		#if  password: [params :password] == cpassword: [params :cpassword]
			User.create(gName: params[:gName], lName: [:lName], email: params[:email], password: params[:password])
			redirect_to root_path
		# else
		# end
	end

	def dtrmain
		
		#Get current time
		# require 'date'
		# current_time = DateTime.now
		# current_time.strftime "%m/%d/%Y %H:%M"

	end
end
