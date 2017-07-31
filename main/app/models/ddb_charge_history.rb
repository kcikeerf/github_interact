# -*- coding: utf-8 -*-
# 

class DdbChargeHistory
  include Dynamoid::Document

  belongs_to :ddb_user, :class => DdbUser
  belongs_to :ddb_charge_plan, :class => DdbChargePlan

  field :cmethod, :string, {default: "paypal"}
  field :payment_id
  field :amount, :number
  field :currency
  field :payment_status, :integer, {default: ->(){ 0 }}

end