# -*- coding: UTF-8 -*-

module ApiV1Repository
  class API < Grape::API
    format :json

    helpers ApiV1Helper
    helpers ApiV1SharedParamsHelper

    params do
      #
    end

    resource :repository do #monitorings begin

      before do
        set_api_header
      end

      ###########

      desc ''
      params do
        #use :oauth
      end
      post :public_list do
        github.repos.list user: current_user["name"]
      end

      ###########
      
    end #auths end

  end #class end
end #monitoring end