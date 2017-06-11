# -*- coding: UTF-8 -*-

class UploadFilesToRepositoryJob < GithubBaseJob
  def initialize args
    super args
    logger.info "init upload"
    @xui_params = {
      :access_token => args[:access_token]
    }
    logger.info args[:path]
    @params = {
      :repo_name => args[:repo_name],
      :path => args[:path],
      :message => "upload by protobuilder.io",
      :content => args[:content]
    }
  end

  def phase1
    logger.info @xui_params
    logger.info @current_user["name"]
    logger.info @params[:repo_name]
    logger.info @params[:path]
    logger.info "/repos/" + @current_user["name"] + "/" + @params[:repo_name] + "/contents/" + @params[:path]
    github_req(@xui_params, "/repos/" + @current_user["name"] + "/" + @params[:repo_name] + "/contents/" + @params[:path], "put", @params)
  end

  def phase1_rollback
  	puts "phase1 rollback"
  end
  
end