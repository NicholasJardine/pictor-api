class Api::V1::AuditionsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_audition, only: [ :show, :update, :destroy ]

  def index
    @auditions = policy_scope(Audition)
  end


  def show
    @audition = Aauditionudition.find(params[:id])
    authorize @audition
  end

  def update
    if @audition.update(audition_params)
      render :show
    else
      render_error
    end
  end

  def create
    @audition = Audition.new(audition_params)
    @audition.user = current_user
    authorize @audition
    if @audition.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @audition.destroy
    head :no_content
  end

  private

  def set_audition
    @audition = Audition.find(params[:id])
    authorize @audition  # For Pundit
  end

  def audition_params
    params.require(:audition).permit(:title, :video, :brief_id, :id)
  end

  def render_error
    render json: { errors: @audition.errors.full_messages },
      status: :unprocessable_entity
  end

end
