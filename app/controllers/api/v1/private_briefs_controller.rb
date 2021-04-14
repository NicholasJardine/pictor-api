class Api::V1::PrivateBriefsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_private_brief, only: [ :show, :update, :destroy ]

  def index
    @private_briefs = policy_scope(PrivateBrief)
  end


  def show
    @private_brief = PrivateBrief.find(params[:id])
    authorize @private_brief
  end

  def update
    if @private_brief.update(brief_params)
      render :show
    else
      render_error
    end
  end

  def create
    @private_brief = PrivateBrief.new(brief_params)
    @private_brief.user = current_user
    authorize @private_brief
    if @private_brief.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @private_brief.destroy
    head :no_content
  end

  private

  def set_private_brief
    @private_brief = PrivateBrief.find(params[:id])
    authorize @private_brief  # For Pundit
  end

  def brief_params
    params.require(:private_brief).permit(:wants, :needs, :id, :ethnicity, :gender, :name)
  end

  def render_error
    render json: { errors: @private_brief.errors.full_messages },
      status: :unprocessable_entity
  end

end
