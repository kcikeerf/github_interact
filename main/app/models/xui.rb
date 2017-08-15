# -*- coding: utf-8 -*-
# 

module Xui
  module_function

  module Spa
    module_function

    def split_with_xui_spa_parameters _params
      result = {}
      Rails.logger.info ">>>>>" + _params["action"]
      case _params["action"]
      when "open"
        if _params["pattern"] == "(?!xui_project_tpl).*"
          _args = _params.deep_dup
          _args["pattern"] ||= "[a-zA-Z0-9].*"
          _args["limited"] ||= 200
          _args["fromIndex"] ||= 0 
          result = Xui::search_local_tpl_path(_params)
          Rails.logger.info "!!!"
        else

        end
      else

      end
      result
    end
  end

  def search_local_tpl_path _params
    result = {}

    f_objs =  Dir.glob( Rails.root.to_s + "/public/" + _params["path"] + "/**" )
    result[:files] = []
    f_objs.each_with_index{|item, index|
      location = File.dirname(item).sub(Rails.root.to_s+"/public/", "")
      result[:files] << {
        id: "*.#{index}",
        layer: 0,
        location: location,
        name: File.basename(item),
        pid: "*",
        type: File.directory?(item) ? 0 : 1
      }
    }

    if _params["withConfig"]
      f_data = File.open(Rails.root.to_s + "/public/" + _params["path"] + "/config.json").read
      result[:conf] = f_data
    end

    if _params["sum"]
      result[:sum] = f_objs.size
    end
    return result
  end
end