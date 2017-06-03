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
        set_resp_header
      end

      ###########

      desc ''
      params do
        optional :type, type: String, values: %W{ all owner public private member }
        optional :sort, type: String, values: %W{ created updated pushed full_name }
        optional :direction, type: String, values: %W{ asc desc }
      end
      post :list do
        #github.repos.list user: current_user["name"]
        paramsh = {
          :type => "all",
          :sort => "created",
          :direction => "desc"
        }
        result = github_req("/user/repos","get", paramsh.merge(params))
        format_response(params, result)
      end

      ###########

      desc ''
      params do
        requires :name, type: String
        optional :description, type: String 
        optional :homepage, type: String
        optional :private, type: Boolean
        optional :auto_init, type: Boolean
      end
      post :create do
        #github.repos.list user: current_user["name"]
        paramsh = {
          :name => "xui" + SecureRandom.urlsafe_base64(nil, false),
          :description => "Created by protobuilder.io",
          :private => false,
          :auto_init => true
        }
        result = github_req("/user/repos","post", paramsh.merge(params))
        format_response(params, result)
      end

      ###########

      desc ''
      params do
        requires :name, type: String
      end
      post :delete do
        result = github_req("/repos/" + current_user["name"] + "/" + params[:name],"delete", nil)
        format_response(params, result)
      end

      ###########

      desc ''
      params do
        requires :name, type: String
        optional :description, type: String 
        optional :homepage, type: String
        optional :private, type: Boolean
      end
      post :edit do
        result = github_req("/repos/" + current_user["name"] + "/" + params[:name],"patch", params)
        format_response(params, result)
      end

      ###########

      desc ''
      params do
        requires :name, type: String
      end
      post :detail do
        result = github_req("/repos/" + current_user["name"] + "/" + params[:name],"get", params)
        format_response(params, result)
      end

      ###########

      desc '查看文件列表'
      params do
        requires :name, type: String
        optional :path, type: String #查看文件路径，默认根目录
      end
      post :file_list do
        result = github_req("/repos/" + current_user["name"] + "/" + params[:name] + "/contents/", "get", params)
        format_response(params, result)
      end

      ###########

      desc '上传文件'
      params do
        requires :name, type: String
        requires :path, type: String # 上传文件路径
        requires :message, type: String # 上传信息
        # requires :content, type: String # Base64文件编码
        optional :branch, type:String # 默认master
      end
      post :commit_file do
        # 此处实现文件Base64转换
        paramsh = {
          :content => #文件Base64转换
        }
        result = github_req("/repos/" + current_user["name"] + "/" + params[:name] + "/contents/" + params[:path], "put", paramsh.merge(params))
        format_response(params, result)
      end

      ###########

      desc '删除文件'
      params do
        requires :name, type: String
        requires :path, type: String # 上传文件路径
        requires :message, type: String # 上传信息
        requires :sha, type: String # 文件Blob SHA
        optional :branch, type:String # 默认master
      end
      post :delete_file do
        result = github_req("/repos/" + current_user["name"] + "/" + params[:name] + "/contents/" + params[:path], "delete", params)
        format_response(params, result)
      end

      ###########

    end #auths end

  end #class end
end #monitoring end