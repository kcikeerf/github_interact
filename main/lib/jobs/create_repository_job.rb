# -*- coding: UTF-8 -*-

class CreateRepositoryJob < GithubBaseJob
  def initialize args
    super args
    @xui_params = {
      :access_token => args[:access_token]
    }
    @params = {
      :name => args[:filename],
      :description => "Created by protobuilder.io",
      :private => false,
      :auto_init => true	
    }
  end

  def phase1
    flag, data = github_req(@xui_params, "/user/repos","post", @params)
    raise data.to_s unless flag
  end

  def phase1_rollback
    puts "phase1 rollback"
  end 
end