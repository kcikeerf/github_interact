# -*- coding: utf-8 -*-
# 

class DdbUserTokens
  include Dynamoid::Document

  belongs_to :ddb_user

  field :token

end