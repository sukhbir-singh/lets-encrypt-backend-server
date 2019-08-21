class HelperMethods
    def self.generateCert(params)
        # get variables
        api = params[:api_key]
        user = AmahiUser.where(["api_key = ?", api]).select("hdaname").first
        puts(user)


        # fetch hda name from db


        # append domain name
        #@domain_name = 'linksam.tk'

        # insert into db with status pending
        
        # request cert factory to generate
        # if success store the generated cert in local db
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

    end


end