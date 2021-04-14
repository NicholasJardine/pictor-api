class Api::V1::PrivateAuditionsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_private_audition, only: [ :show, :update, :destroy ]

  def index
    @private_auditions = policy_scope(PrivateAudition)
  end


  def show
    @private_audition = PrivateAudition.find(params[:id])
    authorize @private_audition
  end

  def update
    if @private_audition.update(private_audition_params)
      render :show
    else
      render_error
    end
  end

  def create
    @private_audition = PrivateAudition.new(private_audition_params)
    @private_audition.user = current_user
    authorize @private_audition
    if @private_audition.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @private_audition.destroy
    head :no_content
  end

  private

  def set_private_audition
    @private_audition = PrivateAudition.find(params[:id])
    authorize @private_audition  # For Pundit
  end

  def private_audition_params
    params.require(:private_audition).permit(:title, :video, :private_brief_id, :id)
  end

  def render_error
    render json: { errors: @private_audition.errors.full_messages },
      status: :unprocessable_entity
  end

end
