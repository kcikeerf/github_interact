# -*- coding: UTF-8 -*-

module ApiV1Xuis
  class API < Grape::API
    format :json

    helpers ApiV1Helper
    helpers ApiV1SharedParamsHelper

    params do
      #
    end

    resource :xui do #monitorings begin

      before do
        error_if_current_ddb_user_expired!
        set_resp_header
      end

      ###########

      desc ''
      params do
        requires :path, type: String, allow_blank: false
        requires :pattern, type: String, allow_blank: false
        requires :type, type: Integer, allow_blank: false
        requires :sum, type: Integer, allow_blank: false
        requires :limited, type: Integer, allow_blank: false
        requires :fromIndex, type: Integer, allow_blank: false
        requires :withConfig, type: Boolean, allow_blank: false
        use :oauth
      end
      post :open do
        # 此处实现文件Base64转换
        _path = params[:path]#.split(github_base_url)[1]
        target_path = params[:path].split(github_base_url)[1]
        target_path = target_path.split("?")[0]

        paramsh = {
          :access_token => params[:access_token]
        }

        re = /(https:\/\/api.github.com\/repos)(\/[^\/]{1,})(\/[^\/]{1,})(\/.*){0,}/
        path_arr = re.match(_path)
        target_path += "/contents" if path_arr[4].blank? || !path_arr[4].include?("contents")

        result = github_req(target_path, "get", paramsh)
        format_response(params, result)
      end

      ###########      

      desc ''
      params do
        requires :packagePath, type: String, allow_blank: false
        requires :path, type: String, allow_blank: false
        requires :filename, type: String, allow_blank: false
        requires :private, type: Boolean, allow_blank: false
        requires :remote, type: Boolean, allow_blank: false
        requires :lang, type: String, allow_blank: false
        use :oauth
      end
      post :newPrj do
        # 创建repository
        step_result1, _ = CreateRepositoryJob.new(params).execute
        error!(I18n.t("api.repo.E52001"), 500) unless step_result1

        # 上传所有模版文件至github
        step_result2, _ = InitRepoWithTemplateJob.new(params).execute
        error!(I18n.t("api.repo.E53001"), 500) unless step_result2

        {message: "created success!"}
      end

      ###########  

    end #xuis end

  end #class end
end #monitoring end
