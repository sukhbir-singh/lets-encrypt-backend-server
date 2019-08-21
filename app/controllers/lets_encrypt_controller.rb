class LetsEncryptController < ApplicationController

	def dashboard
		render "layouts/dashboard"
	end

	def generate_certificate
		api = params[:api_key]
        user = AmahiUser.where(["api_key = ?", api]).pluck(:hdaname)
      
		#success = HelperMethods.generateCert(generate_certificate_params)
        if user
            render :json => {success: true, last_generated_at: user, expiry_date: "8 december 2019 11:59:00"}
        else
        	render :json => {success: false, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        end
	end

	def renew_certificate
		render :json => {success: true, message: "renewal successfully"}
	end

	def delete_certificate
		render :json => {success: true, message: "deletion successfully"}
	end

	def add_user
		new_user = AmahiUser.new(add_user_params)
        if new_user.save
            render :json => {success: true, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        else
        	render :json => {success: false, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        end
	end

	private
    def generate_certificate_params
        params.permit(:api_key)
	end
	
	def add_user_params
		params.permit(:api_key, :username, :hdaname)
	end

end
