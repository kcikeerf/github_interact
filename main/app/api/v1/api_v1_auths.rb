# -*- coding: UTF-8 -*-
require 'net/http'

module ApiV1Auths
  class API < Grape::API
    format :json

    helpers ApiV1Helper

    params do
      #
    end

    resource :auths do #monitorings begin

      before do
        set_resp_header
      end

      ###########

      desc ''
      params do
        requires :private, type: Boolean, default: false
        optional :callback_url, type: String
      end
      get :github_login do
        scope_arr=params[:private] ? %W{ repo } : %W{ public_repo }
        scope_arr << %W{ delete_repo read:org user:email }
        state_str = SecureRandom.urlsafe_base64(nil, false)
        callback_prefix = "http://protobuilder.io/api/v1/auths/github_callback"
        callback_url = callback_prefix + "?forward_to=" + params[:callback_url]
        next_location = "https://github.com/login/oauth/authorize?" +
          "response_type=code&" +
          "redirect_uri=" + callback_url + "&" +
          "scope=" + scope_arr.join(',') + "&" +
          "state=" + state_str + "&" +
          "client_id=" + Common::ClientId
        res1 = Net::HTTP.get_response(URI(next_location))
        next_location = res1.to_hash["location"]
        status 302
        header 'location', next_location
      end

      ###########

      desc ''
      params do
        requires :code, type: String
        requires :forward_to, type: String
      end
      get :github_callback do
        token = github.get_token(params[:code])
        forward_url = params[:forward_to] || "http://protobuilder.io"
        status 307
        header 'location', forward_url + "?access_token=#{token.token}"
      end

      ###########

      desc ''
      params do
      end
      get :github_revoke do
        token = github.get_token(params[:code])        
        status 307
        header 'location', "http://protobuilder.io?access_token=#{token.token}"
      end

      ###########      

    end #auths end

  end #class end
end #monitoring end
