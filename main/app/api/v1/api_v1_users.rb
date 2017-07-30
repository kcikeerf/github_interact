# -*- coding: UTF-8 -*-

module ApiV1Users
  class API < Grape::API
    format :json

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
        current_ddb_user_charge_stat = {
          charge: {
            expired_at: current_ddb_user.expired_at
          }
        }
        format_response(params,current_user.merge(current_ddb_user_charge_stat))
      end

      ###########

      desc ''
      params do
        use :oauth
      end
      get :info do
        current_ddb_user_charge_stat = {
          charge: {
            expired_at: current_ddb_user.expired_at
          }
        }
        format_response(params,current_user.merge(current_ddb_user_charge_stat))
      end

      ###########      
    end #auths end

  end #class end
end #monitoring end