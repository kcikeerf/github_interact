# -*- coding: UTF-8 -*-

class InitRepoWithTemplateJob < GithubBaseJob
  def initialize args    
    @xui_params = {
      :access_token => args[:access_token]
    }
    @tpl_path = Common::get_project_tpl_path(args[:packagePath])
    @tpl_files = Common::iterate_all_files_in_path(@tpl_path)
    @tpl_files.each_with_index{|tpl, index|
      define_singleton_method( "phase" + index.to_s ) {
        target_content = File.open(tpl, 'rb').read
        target_path = tpl.split(@tpl_path + "/")[1]
        logger.info target_path
        UploadFilesToRepositoryJob.new({
          :access_token => args[:access_token],
          :repo_name => args[:filename],
          :path => target_path,
          :message => "upload by protobuilder.io",
          :content => target_content
        }).execute if target_path
      }
    }
    super args
  end
end