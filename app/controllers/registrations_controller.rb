class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

        def create
        super do |resource|
          respond_to do |format|
            format.json { render :json => resource }
          end
        end
      end
end

