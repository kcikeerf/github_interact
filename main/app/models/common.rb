# -*- coding: utf-8 -*-
# 

module Common
  module_function

  #github client and secret信息
  ClientId = "23ab448fa68cded59495"
  ClientSecret = "212ed35e9b844837d7a671606b30d516d1d5bd95"

  #各工程的文件路径
  XuiBasePath = Rails.root.to_s + "/xui/assets"

  module Template
    module Project
      Xui_project_tpl_ActionsDemo = XuiBasePath + "/projects/Simple/xui_project_tpl_ActionsDemo"
      Xui_project_tpl_ClassicLayout = XuiBasePath + "/projects/Simple/xui_project_tpl_ClassicLayout"
      Xui_project_tplcode_AnimatorDemo = XuiBasePath + "/projects/Simple/xui_project_tplcode_AnimatorDemo"
      Xui_project_tplcode_OrderManagement = XuiBasePath + "/projects/Simple/xui_project_tplcode_OrderManagement"
      Xui_project_tplcode_OutLook = XuiBasePath + "/projects/Simple/xui_project_tplcode_OutLook"
    end
  end

  # 获取模版路径
  def get_project_tpl_path target_path
    result = nil
    if target_path.include?("xui_project_tpl_ActionsDemo")
      result = Template::Project::Xui_project_tpl_ActionsDemo
    elsif target_path.include?("xui_project_tpl_ClassicLayout")
      result = Template::Project::Xui_project_tpl_ClassicLayout
    elsif target_path.include?("xui_project_tplcode_AnimatorDemo")
      result = Template::Project::Xui_project_tplcode_AnimatorDemo
    elsif target_path.include?("xui_project_tplcode_OrderManagement")
      result = Template::Project::Xui_project_tplcode_OrderManagement
    elsif target_path.include?("xui_project_tplcode_OutLook")
      result = Template::Project::Xui_project_tplcode_OutLook
    end
    result
  end

  # 遍历目标文件夹所有各级文件
  def iterate_all_files_in_path target_path
    Dir.glob( target_path + "/**/*.*" )
  end

  # 遍历目标文件夹第一层文件
  def iterate_child_files_in_path target_path
    Dir.glob( target_path + "/*.*" )
  end
  
  # 文件内容转Base64
  def file_to_base64 path
    Base64.encode64(File.open(path, "rb").read)
  end  

end