module ApiV1SharedParamsHelper
  extend Grape::API::Helpers

  params :oauth do
  	requires :access_token, type: String, allow_blank: false
  end

  params :comitter do
  	optional :name, type: String
  	optional :email, type: String
  end
end