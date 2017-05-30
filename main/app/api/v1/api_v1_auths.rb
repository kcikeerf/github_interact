# -*- coding: UTF-8 -*-

module ApiV1Auths
  class API < Grape::API
    format :json

    helpers ApiV1Helper

    params do
      #
    end

    resource :auths do #monitorings begin

      before do
        set_api_header
      end

      ###########

      desc '获取绑定的用户列表 post /api/v1.2/auths/binded_users_list'
      params do
        optional :wx_openid, type: String#, allow_blank: false
        optional :wx_unionid, type: String
        at_least_one_of :wx_openid, :wx_unionid
      end
      post :public_repo do
        
      end

      ###########

    end #auths end

  end #class end
end #monitoring end