require 'uri'
require 'net/http'

class HelperMethods
    def self.generateCert(params)
        # get variables
        api = params[:api_key]
        @user = AmahiUser.where("api_key = ?", api)
        @hdaname = @user.pluck(:hdaname).first
        @amahi_user_id = @user.pluck(:id).first

        cert_status = statusCert(params)
        return (cert_status)


        # fetch hda name from db


        # change domain name to yourhda.com
        @domain_name = 'linksam.tk'

        #check if processing or already generated
        #if LetsEncryptLog.exist?(@amahi_user_id)


        # insert into db with status pending
        status = LetsEncryptLog.add(:amahi_users_id => @amahi_user_id, :status => "Processing")
        if status.save
            render :json => {success: true, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        else
        	render :json => {success: false, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        end
        
        # request cert factory to generate

        # provide url of cert factory server
        #url = "http://localhost:5004/api/v1/certi/generate"
        #uri = URI(url)
        #http = Net::HTTP.new(uri.host, uri.port)
        #http.use_ssl = false   # make it true in production

        #request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})

        #request.body = {"hda_name" => "#{@user}", "domain" => "#{@domain_name}"}.to_json # SOME JSON DATA e.g {msg: 'Why'}.to_json

        return (status)


        #response = http.request(request)
        #puts "response #{response.body}"
        #puts JSON.parse(response.body)

        
        # if success store the generated cert in local db


        #user_id = AmahiUser.add(insert_log_params)
        #if user_id.save
        #    render :json => {success: true, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        #else
        #	render :json => {success: false, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        #end
        
        #return (current_status)

        # forward the cert to plugin for install
        #
    end

    def self.revokeCert(params)
        # send certificate
        # request cert factory to delete
        # if success status deleted
    end

    def self.renewCert
        # check if date up for renewal
        
        # request new cert 
        # replace cert in db
        # send new cert to plugin
    end

    def self.statusCert(params)
        # get cert status from db
        api = params[:api_key]
        @user = AmahiUser.where("api_key = ?", api)
        @amahi_user_id = @user.pluck(:id).first

        if LetsEncryptLog.exists?(@amahi_user_id)
            current_status = LetsEncryptLog.where("amahi_users_id = ?", @amahi_user_id).pluck(:status).first
            return (current_status)
        else
            current_status = "Not Available"
            return (current_status)
        end
    end
end