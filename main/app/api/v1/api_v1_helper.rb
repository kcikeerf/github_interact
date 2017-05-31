# -*- coding: UTF-8 -*-
require 'net/https'
module ApiV1Helper
  def set_resp_header
    header 'Access-Control-Allow-Origin','*'
    header 'Access-Control-Request-Method', 'GET, POST, PUT, OPTIONS, HEAD'
    header 'Access-Control-Allow-Headers', 'x-requested-with,Content-Type, Authorization'    
  end

  def github
  	Github.new client_id: '23ab448fa68cded59495', client_secret: '212ed35e9b844837d7a671606b30d516d1d5bd95'
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

  def github_req target_api, http_method, header_h={}
    base_url = "https://api.github.com"
    target_api = base_url + "/user"
    uri = URI(target_api)

    req = nil
    case http_method
    when "get"
      req = Net::HTTP::Get.new(target_api)
    when "post"
      req = Net::HTTP::Post.new(target_api)
    when "delete"
      req = Net::HTTP::Delete.new(target_api)
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
    
    JSON.parse(res.body)
  end
end