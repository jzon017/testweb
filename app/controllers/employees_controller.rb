class EmployeesController < ApplicationController
	def dtr
	end	

	def create
		#if  password: [params :password] == cpassword: [params :cpassword]
		#Error handling for the input
		str = params[:gName]
		str1 = params[:lName]
		chk = str.count('0-9' + '!-?' + ' ') > 0 || str1.count('0-9' + '!-?' + ' ') > 0
		if chk == false
			User.create(gName: params[:gName], lName: params[:lName], email: params[:email], password: params[:password])
			redirect_to signin_path
		# else
		# end
		else
			#Need prompt error!
			redirect_to root_path
		end
	end

	def dtrmain
	end

	def gettime

		#Get current time
		require 'date'
		d = Time.now
		d.strftime("%d/%m/%Y %H:%M")
		da = Time.now
		da.strftime("%d/%m/%Y")

		if params[:commit] == 'Time In'
			if User.find_by(gName: params[:gName], lName: params[:lName])
				if da = :timein
					if Dtr.find_by(gName: params[:gName], lName: params[:lName])
					#redirect_to root_path
					else
					Dtr.create(gName: params[:gName], lName: params[:lName], wAssigned: params[:wAssigned], timein: d)
					#Dito idisplay sa textbox timein
					end
				else
       			end
       		else
       		end
    	elsif params[:commit] == 'Time Out'
    		if User.find_by(gName: params[:gName], lName: params[:lName])
    			if a = Dtr.find_by(gName: params[:gName], lName: params[:lName])
    			a.timeout = d
    			a.save
    			#Dito idisplay sa textbox timeout
    			redirect_to root_path
    			else
    			end
    		else
    		end
    	end
	end

	def dtr_output
		@dtrs = Dtr.all
	end
end
