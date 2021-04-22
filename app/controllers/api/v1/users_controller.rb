  class Api::V1::PrivateInvitesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_private_invite, only: [ :show, :update, :destroy ]

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

  def set_private_invite
    @private_invite = PrivateInvite.find(params[:id])
    authorize @private_invite  # For Pundit
  end

  def private_invite_params
    params.require(:private_invite).permit(:private_brief_id, :id, :user_id, :status)
  end

  def render_error
    render json: { errors: @private_invite.errors.full_messages },
      status: :unprocessable_entity
  end

end
