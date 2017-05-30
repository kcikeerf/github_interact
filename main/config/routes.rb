Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ### API V1
  mount ApiV1Auths::API => "/api/v1/"
  mount ApiV1Github::API => "/api/v1/"
  #######################################

end
