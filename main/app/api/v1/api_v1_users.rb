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
        current_user
      end

      ###########
      
    end #auths end

  end #class end
end #monitoring end