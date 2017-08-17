# -*- coding: UTF-8 -*-

module ApiV1Users
  class API < Grape::API
    format :txt

    helpers ApiV1Helper
    helpers ApiV1SharedParamsHelper

    params do
      #
    end

    resource :users do #monitorings begin

      before do
        set_resp_header
      end

      ###########

      desc ''
      params do
        use :oauth
      end
      post :info do
        current_ddb_user_charge_stat = {}
        # if current_ddb_user.expired_at
        #   user_time_left = current_ddb_user.expired_at.to_i - Time.now.to_i
        #   current_ddb_user_charge_stat = {
        #     charge: {
        #       expired_at: current_ddb_user.expired_at,
        #       time_left: ( user_time_left > 0 ) ? user_time_left : 0
        #     }
        #   }
        # end
        format_response(params,current_user.merge(current_ddb_user_charge_stat))
      end

      ###########

      desc ''
      params do
        use :oauth
      end
      get :info do
        current_ddb_user_charge_stat = {}
        # if current_ddb_user.expired_at
        #   user_time_left = current_ddb_user.expired_at.to_i - Time.now.to_i
        #   current_ddb_user_charge_stat = {
        #     charge: {
        #       expired_at: current_ddb_user.expired_at,
        #       time_left: ( user_time_left > 0 ) ? user_time_left : 0
        #     }
        #   }
        # end
        format_response(params,current_user.merge(current_ddb_user_charge_stat), "users")
      end

      ###########      
    end #auths end

  end #class end
end #monitoring end