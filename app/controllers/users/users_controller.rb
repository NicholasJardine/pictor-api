class Users::UsersController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
end
