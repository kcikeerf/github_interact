# -*- coding: utf-8 -*-
# 

class DdbChargePlan
  include Dynamoid::Document

  has_many :ddb_charge_histories, :class => DdbChargeHistory

  field :name
  field :description
  field :comment
  field :ctype, :integer
  field :price, :number
  field :currency
  field :duration, :integer

end