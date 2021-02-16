class Api::V1::UserBriefsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_user_brief, only: [ :show, :update, :destroy ]

  def index
    @user_briefs = policy_scope(UserBrief)
  end


  def show
    @user_brief = UserBrief.find(params[:id])
    authorize @user_brief
  end

  def update
    if @user_brief.update(user_brief_params)
      render :show
    else
      render_error
    end
  end

  def create
    @user_brief = UserBrief.new(user_brief_params)
    @user_brief.user = current_user
    authorize @user_brief
    if @user_brief.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @user_brief.destroy
    head :no_content
  end

  private

  def set_user_brief
    @user_brief = UserBrief.find(params[:id])
    authorize @user_brief  # For Pundit
  end

  def user_brief_params
    params.require(:user_brief).permit(:user_id, :brief_id, :id)

  end

  def render_error
    render json: { errors: @user_brief.errors.full_messages },
      status: :unprocessable_entity
  end

end
