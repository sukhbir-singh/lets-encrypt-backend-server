class LetsEncryptController < ApplicationController
	def generate_certificate
		render :json => {success: true, message: "generated successfully"}
	end

	def renew_certificate
		render :json => {success: true, message: "renewal successfully"}
	end

	def delete_certificate
		render :json => {success: true, message: "deletion successfully"}
	end
end
