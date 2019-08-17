module Api
    module V1
        class LEUsersController < ApplicationController
            
            def db_status
                leusers = LEUser.order('created_at DESC');
                render :json => {status:'Success', message:'Loaded Status', data:leusers}
            end

            def db_create
                leuser = LEUser.new(user_params)
                if leuser.save
                    render :json => {status:'Success', message:'Saved', data:leuser}
                else
                    render :json => {status:'Error', message:'Not Saved'}
                end
            end

            private
            def user_params
                user_params.permit(:username, :hdaname, :domain, :status)
            end
        end
    end
end