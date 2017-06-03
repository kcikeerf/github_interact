# -*- coding: UTF-8 -*-
require 'net/https'
module ApiV1Helper
  def set_resp_header
    header 'Access-Control-Allow-Origin','*'
    header 'Access-Control-Request-Method', 'GET, POST, PUT, OPTIONS, HEAD'
    header 'Access-Control-Allow-Headers', 'x-requested-with,Content-Type, Authorization'    
  end

  def resp_formatter

  end

  def github
  	Github.new client_id: Common::ClientId, client_secret: Common::ClientSecret
  end

  def current_user
    target_api = "https://api.github.com/user"
    uri = URI(target_api)
    req = Net::HTTP::Get.new(target_api)
    req['User-Agent'] = 'xui'
    req['Accept'] = 'application/json'
    req['Content-Type'] = 'application/json'
    req['Authorization'] = "token #{params[:access_token]}"

    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
      http.request(req) 
    }
    
    JSON.parse(res.body)
  end

  def github_req target_api, http_method, param_data={}, header_h={}
    base_url = "https://api.github.com"
    target_api = base_url + target_api
    uri = URI(target_api)

    req = nil
    case http_method
    when "get"
      target_api += "?" + URI.encode_www_form(param_data) if !param_data.blank?
      req = Net::HTTP::Get.new(target_api)
    when "post"
      req = Net::HTTP::Post.new(target_api)
      req.body = param_data.to_json
    when "delete"
      req = Net::HTTP::Delete.new(target_api)
    when "patch"
      req = Net::HTTP::Patch.new(target_api)
    end
    return nil unless req

    req['User-Agent'] = 'xui'
    req['Accept'] = 'application/json'
    req['Content-Type'] = 'application/json'
    req['Authorization'] = "token #{params[:access_token]}" if !params[:access_token].blank?

    header_h.each{|k,v|
      req[k] = v
    }

    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
      http.request(req) 
    }

    res.body.blank?? {} : JSON.parse(res.body)
  end

  # Used for format the response data if have callback parameter    
  def format_response target_params, target_result
    callback_str = target_params[:callback].blank? ? "3,,no" : ((target_params[:callback]=='window.name')? "1,,#{target_params[:callback]}" : "2,,#{target_params[:callback]}")
    callback_arr = callback_str.split(',,')

    case target_result.class.to_s
    when 'Hash','Array'#Array maybe no this type
      data_json = target_result.to_json
    when 'String'
      data_json = target_result
    end 

    case callback_arr[0].to_i
    #如果request中带有callback参数，并且callback等于"window.name"
    when 1
      header "Content-Type", "text/html"
      '<script type="text" id="json">
         {"data":' + data_json + '}
      </script>
      <script type="text/javascript">window.name=document.getElementById("json").innerHTML;</script>'
    #如果request中带有callback参数，并且callback不等于"window.name"（例如是"xui.SAjax.No._1"）
    when 2
      header "Content-Type", "text/html"
      callback_arr[1] + '({"data":' + data_json + '}});'
    #如果request中没有callback
    when 3
      { :data => target_result }
    end
  end
  
end