class UserSession < Authlogic::Session::Base
  secure Rails.env.production?
  httponly true
  single_access_allowed_request_types :all
  params_key :api_key
end
