# -*- coding: utf-8 -*-
# 

class DdbUser
  include Dynamoid::Document

  has_many :ddb_charge_histories
  has_many :ddb_user_tokens

  field :github_name
  field :github_id
  field :expired_at, :datetime
  field :from_ip

  def expired?
    expired_at < Time.now
  end
end