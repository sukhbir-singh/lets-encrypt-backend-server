class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	before_action :set_headers

	def set_headers
		headers['Access-Control-Allow-Origin'] = "*"
	end
end
