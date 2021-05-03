class Api::V1::Users::UserRegistrationsController < Devise::RegistrationsController

    skip_before_action :verify_authenticity_token

    respond_to :json
end
