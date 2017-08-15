# -*- coding: UTF-8 -*-

module ApiV1Spa
  class API < Grape::API
    format :json

    helpers ApiV1Helper
    helpers ApiV1SharedParamsHelper

    params do
      #
    end

    resource :spa do #monitorings begin

      before do
        error_if_current_ddb_user_expired!
        set_resp_header
      end

      ###########

      desc ''
      params do
        # requires :key, type: String, allow_blank: false, values: ["RAD"]
        # requires :paras, type: Hash, allow_blank: false
        # group :paras, type: Hash do
        #   requires :action
        #   given action: ->(val) { val == 'open' } do
        #     optional :pattern, type: String
        #     optional :withConfig, type: Boolean
        #     optional :hashCode, type: String
        #     optional :type, type: String
        #     optional :path, type: String
        #     optional :sum, type: Boolean
        #     # optional :limited, type: Integer
        #     # optional :fromIndex, type: Integer
        #   end
        # end
        use :oauth
      end
      get '/' do
        result = Xui::Spa::split_with_xui_spa_parameters(JSON.parse(params[:paras]))
        Rails.logger.info result
        format_response(params, result)
      end

      ###########  

    end #xuis end

  end #class end
end #monitoring end
