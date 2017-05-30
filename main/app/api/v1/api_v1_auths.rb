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
        set_api_header
      end

      ###########

      desc ''
      params do
        requires :private, type: Boolean, default: false
      end
      get :github_login do
        state_str = SecureRandom.urlsafe_base64(nil, false)
        next_location = "https://github.com/login/oauth/authorize?" +
          "response_type=code&" +
          "redirect_uri=http://protobuilder.io/api/v1/auths/github_callback&" +
          "scope=public_repo,read:org,user:email&" +
          "state=" + state_str + "&" +
          "client_id=23ab448fa68cded59495"
        res1 = Net::HTTP.get_response(URI(next_location))
        next_location = res1.to_hash["location"]
        status 302
        header 'location', next_location
      end

      ###########


      desc ''
      params do
      end
      get :github_callback do
        github = Github.new client_id: '23ab448fa68cded59495', client_secret: '212ed35e9b844837d7a671606b30d516d1d5bd95'
        token = github.get_token(params[:code])        
        status 307
        header 'location', "http://protobuilder.io/?access_token=#{token.token}"
      end

      ###########

    end #auths end

  end #class end
end #monitoring end
