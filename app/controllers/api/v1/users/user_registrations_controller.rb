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




  # def create


  #       super do |resource|

  #     if resource.occupation == "Actor"

  #               if resource.age <6
  #         resource.age_range = "0-5"
  #       end

  #               if resource.age < 11 && resource.age > 5
  #         resource.age_range = "6-10"
  #       end
  #               if resource.age <16 && resource.age > 10
  #         resource.age_range = "11-15"
  #       end

  #       if resource.age <21 && resource.age > 15
  #         resource.age_range = "16-20"
  #       end
  #       if resource.age <26 && resource.age > 20
  #         resource.age_range = "21-25"
  #       end

  #       if resource.age <31 && resource.age > 25
  #         resource.age_range = "26-30"
  #       end

  #       if resource.age <36 && resource.age > 30
  #         resource.age_range = "31-35"
  #       end

  #       if resource.age <41 && resource.age > 35
  #         resource.age_range = "36-40"
  #       end

  #       if resource.age <46 && resource.age > 40
  #         resource.age_range = "41-45"
  #       end

  #               if resource.age <51 && resource.age > 45
  #         resource.age_range = "46-50"
  #       end

  #       if resource.age <56 && resource.age > 50
  #         resource.age_range = "51-55"
  #       end
  #       if resource.age <61 && resource.age > 55
  #         resource.age_range = "56-60"
  #       end

  #       if resource.age <66 && resource.age > 60
  #         resource.age_range = "61-65"
  #       end

  #       if resource.age <71 && resource.age > 65
  #         resource.age_range = "66-70"
  #       end

  #       if resource.age <76 && resource.age > 70
  #         resource.age_range = "71-75"
  #       end

  #       resource.save
  #     end
  #   end


# def destroy_user
#   @u = User.find(params: id)
#   @u.destroy
#   redirect_to :root
# end

#   end


  protected

  def configure_permitted_perameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:occupation, :email, :password, :photo, :accepted_terms, :age, :age_range)}
    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:occupation, :email, :password, :photo)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:occupation, :email, :password, :password_confirmation, :current_password, :name, :age, :gender, :ethnicty, :province, :photo, :bio, :address,:contact_details, :age_range, :agent_details, :talents, :socialmedia, :website, :cv, :ciricv, :services, :cell,:tel,:company_email)}
  end


  private

  def user_not_authorized(exception)
    render json: {
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

end

