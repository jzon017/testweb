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
			if (params[:gName] != ("" || nil) ) && (params[:lName] != ("" || nil)) && (params[:email] != ("" || nil)) && (params[:password] != ("" || nil)) && (params[:cpassword] != ("" || nil))
				tst = User.find_by(gName: params[:gName], lName: params[:lName], email: params[:email])
				tst1 = User.find_by(email: params[:email])
				if tst == nil
					if tst1 == nil
						User.create(gName: params[:gName], lName: params[:lName], email: params[:email], password: params[:password])
						redirect_to signin_path
						#Notification success na nakapagcreate na
					else
						redirect_to root_path
						#Notification merong existing email	
					end
				else
					redirect_to root_path
					#Notification existing yung account
				end
			else
				#Notification error na dapat walang blank
				redirect_to root_path
			end
		else
			#Notification format error
			redirect_to root_path
		end
	end

	def dtrmain
	end

	def gettime

		#Get current time
		require 'date'
		d = Time.current
		d.strftime("%d-%m-%Y %H:%M")
		da = Time.current
		da.strftime("%d-%m-%Y")
		

		if params[:commit] == 'Time In'
			if User.find_by(gName: params[:gName], lName: params[:lName])
				if Dtr.find_by(gName: params[:gName], lName: params[:lName]) != nil
					dar = Dtr.where(gName: params[:gName], lName: params[:lName]).last.timein
					dar.strftime("%d-%m-%Y")
					if da.strftime("%d-%m-%Y") == dar.strftime("%d-%m-%Y") 
						#Prompt already timed in
						redirect_to root_path
					else
						Dtr.create(gName: params[:gName], lName: params[:lName], wAssigned: params[:wAssigned], timein: d)
						redirect_to root_path
						#Notification success timein
       				end
       			else
       				Dtr.create(gName: params[:gName], lName: params[:lName], wAssigned: params[:wAssigned], timein: d)
       				redirect_to root_path
       				#Notification success timein
       			end
       		else
       			#Notification hindi existing yung acct
       		end
    	elsif params[:commit] == 'Time Out'
    		if User.where(gName: params[:gName], lName: params[:lName]).last
    			if Dtr.where(gName: params[:gName], lName: params[:lName]).last.timeout == nil
    				a = Dtr.where(gName: params[:gName], lName: params[:lName]).last
    				a.timeout = d
    				a.save
    				#Dito idisplay sa textbox timeout
    			else
    				redirect_to root_path
    				#prompt already timed out
    			end
    		else
    		end
    	end
	end

	def dtr_output
		@dtrs = Dtr.all
		if params[:commit] == 'Submit'
			if params[:date1] != params[:date2]
				@dtrs = Dtr.where('timein BETWEEN ? AND ?', params[:date1], (Date.parse(params[:date2])+1.day)).all
				#User input date range
			elsif params[:date1] == params[:date2]
				@dtrs = Dtr.where('timein BETWEEN ? AND  ?', params[:date1], (Date.parse(params[:date2])+1.day)).all
				#Notif na dapat pareho yung user input date 
			else
				@dtrs = Dtr.all
			end
		else
		end
	end

	def reg
	end
	def forgotpass
		if params[:enter] == 'Submit'
			if User.find_by(email: params[:email])
				a = User.find_by(email: params[:email]).password_digest
				b = (BCrypt::Password.new(a) == params[:opassword])
				c = User.find_by(email: params[:email])
				if b == true
					if params[:npassword] == params[:cnpassword]
						c.password_digest = BCrypt::Password.create(params[:npassword])
						c.save
						redirect_to signin_path
						#Notification success yung timeout
					else
						#Notification error na dapat pareho yung new pass at confirm pass
					end
				else
					redirect_to reg_path
				end
			else
			end
		else
		end
	end
end
