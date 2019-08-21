class HelperMethods
    def self.generateCert(params)
        # get variables
        api = params[:api_key]
        @user = AmahiUser.where(["api_key = ?", api]).pluck(:hdaname)
        puts(user)


        # fetch hda name from db


        # append domain name
        @domain_name = 'linksam.tk'

        # insert into db with status pending
        
        # request cert factory to generate

        # provide url of cert factory server
        url = http://localhost:5004/certi/generate
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = false   # make it true in production

        request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})

        request.body = {"hdaname" : "#{@user}", "domain" : "#{@domain_name}"} # SOME JSON DATA e.g {msg: 'Why'}.to_json

        response = http.request(request)

        body = JSON.parse(response.body)
        # 
        # if success store the generated cert in local db
        user_id = AmahiUser.add(insert_log_params)
        if user_id.save
            render :json => {success: true, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        else
        	render :json => {success: false, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
        end
        
        return (current_status)

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

    def self.statusCert
        # get cert status from db
        api = params[:api_key]
        user_id = AmahiUser.where(["api_key = ?", api]).pluck(:id)
        current_status = LetsEncryptLog.where(["amahi_users_id = ?", user_id]).pluck(:status)
        
        return (current_status)
    end
end