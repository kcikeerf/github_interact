# -*- coding: UTF-8 -*-
require 'net/https'
require 'logger'

module ApiV1Helper
  def logger
    Rails.logger
  end

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

  def github_base_url
    "https://api.github.com"
  end

  def current_user _current_token=nil
    target_token = params[:access_token] || _current_token
    target_api = github_base_url + "/user"
    uri = URI(target_api)
    req = Net::HTTP::Get.new(target_api)
    req['User-Agent'] = 'xui'
    req['Accept'] = 'application/json'
    req['Content-Type'] = 'application/json'
    req['Authorization'] = "token #{target_token}"

    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
      http.request(req) 
    }
    
    # JSON.parse(res.body)
    if res.body.blank?
      {}
    else
      if res.body.include?("Bad credentials")
        {error: {code: "-100", message: "error message"}}
      else
        JSON.parse(res.body)
      end
    end    
  end

  def current_ddb_user
    item = DdbUserTokens.where(token: params[:access_token]).first
    item.blank? ? nil : item.ddb_user
  end

  def error_if_current_ddb_user_expired!
    error!("You have used up all your payment, please charge to continue.", 500) if current_ddb_user.expired?
  end

  def record_user_token! _current_token=nil
    github_user = current_user(_current_token)
    target_user = DdbUser.where(github_name: github_user["login"]).first
    unless target_user
      target_user = DdbUser.new({
        github_name: github_user["login"],
        github_id: github_user["id"],
        expired_at: Time.now
      })
      target_user.save!
    end
    DdbUserTokens.new({
      token: _current_token,
      ddb_user_ids: [target_user.id]
    }).save!
  end

  def github_req target_api, http_method, param_data={}, header_h={}
    logger.info "github request"
    logger.info target_api
    target_api = github_base_url + target_api
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
    when "put"
      req = Net::HTTP::Put.new(target_api)
      req.body = param_data.to_json
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

    if res.body.blank?
      {}
    else
      if res.body.include?("Bad credentials")
        {error: {code: "-100", message: "error message"}}
      else
        JSON.parse(res.body)
      end
    end
  end

  # Used for format the response data if have callback parameter    
  def format_response target_params, target_result
    # callback_str = target_params[:callback].blank? ? "3,,no" : ((target_params[:callback]=='window.name')? "1,,#{target_params[:callback]}" : "2,,#{target_params[:callback]}")
    if target_params[:callback].blank?
      callback_str = "3,,"
    elsif target_params[:callback]=='window.name'
      callback_str = "1,,#{target_params[:callback]}"
    elsif target_params[:callback].include?(":")
      callback_str = "2,,#{target_params[:callback]}"
    else
      callback_str = "3,,#{target_params[:callback]}"
    end
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
      header "Content-Type", "text/html;charset=UTF-8"
      '<script type="text" id="json">({"data":' + data_json + '})</script>
      <script type="text/javascript">window.name=document.getElementById("json").innerHTML;</script>'
    #如果request中带有callback参数，并且callback不等于"window.name"（例如是"xui.SAjax.No._1"）
    when 2
      header "Content-Type", "text/html;charset=UTF-8"
      # callback_arr[1] + '({"data":' + data_json + '}});'

      '<script type="text" id="json">({"data":' + data_json + '})</script>
      <script type="text/javascript">parent.postMessage(document.getElementById("json").innerHTML,"' + (callback_arr[1] || "").sub(/([^:]+:\/\/[^\/]+).*/, '\1')+ '");</script>'

    #如果request中没有callback
    when 3
      header "Content-Type", "text/html;charset=UTF-8"
      #{ :data => target_result }
      (callback_arr[1] || "")  + '(' + data_json + ')'
    end
  end

  def file_to_base64 path
    Base64.encode64(File.open(path, "rb").read)
  end

end