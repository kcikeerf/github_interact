module ApiV1SharedParamsHelper
  extend Grape::API::Helpers

  params :oauth do
  	optional :access_token, type: String, allow_blank: true
  end

  params :comitter do
  	optional :name, type: String
  	optional :email, type: String
  end
end