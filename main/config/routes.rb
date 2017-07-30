Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcomes#index'

  # constraints (DomainConstraint.new('protobuilder.io')) do

    ### API V1
    mount ApiV1Auths::API => "/api/v1/"
    mount ApiV1Repository::API => "/api/v1/"
    mount ApiV1Users::API => "/api/v1/"
    mount ApiV1Xuis::API => "/api/v1/"
    mount ApiV1PayPals::API => "/api/v1"
  # end
end
