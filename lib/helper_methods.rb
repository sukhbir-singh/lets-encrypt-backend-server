require 'uri'
require 'net/http'

class HelperMethods
    def self.generateCert(params)
        # get variables
        

        cert_status = statusCert(params)
        if cert_status == "Not Available"
            initiateCertGen(params)
        else
            return (cert_status)
        end


        # fetch hda name from db


        # change domain name to yourhda.com
        #@domain_name = 'linksam.tk'

        #check if processing or already generated
        #if LetsEncryptLog.exist?(@amahi_user_id)


        # insert into db with status pending
        #status = LetsEncryptLog.add(:amahi_users_id => @amahi_user_id, :status => "Processing")
        #if status.save
        #    render :json => {success: true, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        #else
        #	render :json => {success: false, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        #end
        
        # request cert factory to generate

        # provide url of cert factory server
        #url = "http://localhost:5004/api/v1/certi/generate"
        #uri = URI(url)
        #http = Net::HTTP.new(uri.host, uri.port)
        #http.use_ssl = false   # make it true in production

        #request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})

        #request.body = {"hda_name" => "#{@user}", "domain" => "#{@domain_name}"}.to_json # SOME JSON DATA e.g {msg: 'Why'}.to_json

        #return (status)


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

    def self.initiateCertGen(params)
        api = params[:api_key]
        @user = AmahiUser.where("api_key = ?", api)
        @hdaname = @user.pluck(:hdaname).first
        @amahi_user_id = @user.pluck(:id).first

        # change domain name to yourhda.com
        @domain_name = 'linksam.tk'

        # insert into db with status pending
        status = LetsEncryptLog.new(:amahi_users_id => @amahi_user_id, :status => "Processing")
        status.save

        # request cert factory to generate

        # provide url of cert factory server
        url = "http://localhost:5004/api/v1/certi/generate"
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.read_timeout = 1000
        http.use_ssl = false   # make it true in production
        request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
        request.body = {"hda_name" => "#{@hdaname}", "domain" => "#{@domain_name}"}.to_json # SOME JSON DATA e.g {msg: 'Why'}.to_json
        http.request(request)

        return (status)
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
            if current_status == "Processing"
                #check status of cert in cert factory
                # if not generated
                return ("Under Process. Please wait.")
                #generated change status to issued and get the certificate
            elsif current_status == "Issued"
                return ("Already issued")
            end          
        else
            current_status = "Not Available"
            return (current_status)
        end
    end
end