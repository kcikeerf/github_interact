# -*- coding: UTF-8 -*-

require 'logger'

class GithubBaseJob
  attr_accessor :phases, :phases_rollback

  def initialize args
    @github_base_url = "https://api.github.com"
    @phases = self.methods.grep(/(phase)[0-9]{1,}$/).sort
    @phases_rollback = self.methods.grep(/(phase)[0-9]{1,}_rollback$/).sort
    @access_token = args[:access_token]
    @current_user = get_current_user @access_token
    logger.info @current_user
  end

  def logger
    Rails.logger
  end

  def execute
    result = false
    begin
      current_state = 0
      @phases.each_with_index{|phase, index|
        current_state = index
        self.send(phase)
      }
      result = true
    rescue Exception => ex
      logger.debug ex.message
      logger.debug ex.backtrace
      @phases_rollback[0..current_state].reverse.each{|phase_rollback|
        self.send(phase_rollback)
      }
      raise ex
    end
  end

  def get_current_user access_token
    target_api = @github_base_url + "/user"
    uri = URI(target_api)
    req = Net::HTTP::Get.new(target_api)
    req['User-Agent'] = 'xui'
    req['Accept'] = 'application/json'
    req['Content-Type'] = 'application/json'
    req['Authorization'] = "token #{access_token}"

    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
      http.request(req) 
    }
    
    JSON.parse(res.body)
  end

  def github_req xui_params, target_api, http_method, param_data={}, header_h={}
    result_flag = false
    target_api = @github_base_url  + target_api
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
    return false, nil unless req

    req['User-Agent'] = 'xui'
    req['Accept'] = 'application/json'
    req['Content-Type'] = 'application/json'
    req['Authorization'] = "token #{xui_params[:access_token]}" if !xui_params[:access_token].blank?

    header_h.each{|k,v|
      req[k] = v
    }

    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) {|http|
      http.request(req) 
    }

    logger.info res.code
    case res.code
    when "200","201"
      result_flag = true
    end
    return result_flag, res.body.blank?? {} : JSON.parse(res.body)
  end  
end