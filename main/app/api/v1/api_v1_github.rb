# -*- coding: UTF-8 -*-

module ApiV1Github
  class API < Grape::API
    format :json

    helpers ApiV1Helper

    params do
      #
    end

    resource :github do #monitorings begin

      before do
        set_api_header
      end

      ###########

      desc 'callback api'
      params do
        # optional :wx_openid, type: String#, allow_blank: false
        # optional :wx_unionid, type: String
        # at_least_one_of :wx_openid, :wx_unionid
      end
      get :callback do
        p params
      end

      ###########
      
    end #auths end

  end #class end
end #monitoring end