class Users::UserRegistrationsController < Devise::RegistrationsController
  include Pundit

  skip_before_action :authenticate_user!
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :configure_permitted_perameters, if: :devise_controller?,  :set_acceptance, only: [ :show, :update, :destroy ]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found



  def index
    @users = policy_scope(User)
  end


  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  def create
    @user = User.new(user_params)
    @user.user = current_user
    authorize @user
    if @user.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_acceptance
    @user = User.find(params[:id])
    authorize @user  # For Pundit
  end

  def user_params
    params.require(:acceptance).permit(:id, :status, :user_id, :private_invite_id)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

end

