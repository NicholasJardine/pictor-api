# class Users::RegistrationsController < Devise::RegistrationsController

#     skip_before_action :verify_authenticity_token


# def create

# user = User.new(user_params)

# if user.save

# render :json=> user.as_json(:auth_token=>user.authentication_token, :email => user.email ), :status=>201

# return

# else

# warden.custom_failure!

# render :json => user.errors, :status=>422

# end

# end

# private

# def user_paramssignin

# params.require(:user).permit(:email,:password,:password_confirmation,:mobile,:name)

# end

# end

