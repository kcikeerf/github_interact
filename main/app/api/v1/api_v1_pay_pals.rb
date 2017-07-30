# -*- coding: UTF-8 -*-

module ApiV1PayPals
  class API < Grape::API
    include PayPal::SDK::REST

    format :json

    helpers ApiV1Helper
    helpers ApiV1PayPalHelper
    helpers ApiV1SharedParamsHelper

    params do
      #
    end

    resource :pay_pals do #paypals begin

      before do
        set_resp_header
      end

      desc ''
      params do
        requires :charge_plan_type, type: Integer, allow_blank: false
        optional :quantity, type: Integer, allow_blank: false
        optional :paypal_return_url, type: String, allow_blank: false
        optional :paypal_cancel_url, type: String, allow_blank: false
        use :oauth
      end
      post :create do
        _target_charge_plan = DdbChargePlan.where(ctype: params[:charge_plan_type]).first
        _payment = Payment.new({
          :intent =>  "sale",
          :payer =>  {
            :payment_method =>  "paypal" 
          },
          :redirect_urls => {
            :return_url => Common::PaypalCreateReturnUrl,
            :cancel_url => Common::PaypalCreateCancelUrl 
          },
          :transactions =>  [
            {
              :item_list => {
                :items => [
                  {
                    :name => _target_charge_plan.name,
                    :price => _target_charge_plan.price,
                    :currency => _target_charge_plan.currency,
                    :quantity => params[:quantity] || 1
                  }
                ]
              },
              :amount =>  {
                :total => _target_charge_plan.price,
                :currency => _target_charge_plan.currency 
              },
              :description =>  "You will pay for the plan." 
            }
          ]
        })
        if _payment.create
          _target_user = current_ddb_user
          _payment_id = _payment.id
          begin
            Rails.logger.info _target_user.id
            Rails.logger.info _target_charge_plan.id
            Rails.logger.info _payment_id
          item = DdbChargeHistory.new({
            ddb_user_ids: [_target_user.id],
            ddb_charge_plan_ids: [_target_charge_plan.id],
            payment_id: _payment_id
          })
          item.save
          Rails.logger.
          raise item.errors unless item
        rescue Exception => ex
          Rails.logger.info ex.message
          Rails.logger.info ex.backtrace
        end
          {
            "payment_id": _payment_id
          }
        else
          status 500
          {
            message: _payment.error
          }
        end
      end

      ###########

      desc ''
      params do
        # requires :payment_id, type: Integer, allow_blank: false
        # requires :payer_id, type: Integer, allow_blank: true
        use :oauth
      end
      post :execute do
        _payment_id = params[:payment_id]
        _payer_id = params[:payer_id]
        _payment = Payment.find(_payment_id)

        if _payment.execute( :payer_id => _payer_id )
          _target_user = current_ddb_user
          _target_charge = DdbChargeHistory.where({
            ddb_user_ids: Set.new([_target_user.id]),
            payment_id: _payment_id
            }).first
          _target_charge_plan = _target_charge.ddb_charge_plan
          _final_time_line = ( _target_user.expired_at > Time.now ) ? _target_user.expired_at : Time.now
          
          _target_charge.update_attributes({
            payment_status: 1
          })
          _target_user.update_attributes({
            expired_at: _final_time_line + _target_charge_plan.duration
          })

          {
            message: "success"#,
            # data: _payment.to_hash
          }
        else
          status 500
          {
            message: _payment.error
          }
        end
      end

    end #pay pals end

  end #class end
end #module end
