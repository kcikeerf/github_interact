# -*- coding: UTF-8 -*-

module ApiV1Charges
  class API < Grape::API
    format :json

    helpers ApiV1Helper
    helpers ApiV1SharedParamsHelper

    params do
      #
    end

    resource :charges do #monitorings begin

      before do
        set_resp_header
      end

      ###########

      desc ''
      params do
        use :oauth
      end
      post :history do
        target_history = current_ddb_user.ddb_charge_histories
        format_response(params, target_history.map{|item| item.attributes})
      end

      ###########      
    end #auths end

  end #class end
end #monitoring end