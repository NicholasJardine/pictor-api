class Api::V1::AcceptancesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_acceptance, only: [ :show, :update, :destroy ]

  def index
    @acceptances = policy_scope(Acceptance)
  end


  def show
    @acceptance = Acceptance.find(params[:id])
    authorize @acceptance
  end

  def update
    if @acceptance.update(acceptance_params)
      render :show
    else
      render_error
    end
  end

  def create
    @acceptance = Acceptance.new(acceptance_params)
    @acceptance.user = current_user
    authorize @acceptance
    if @acceptance.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @acceptance.destroy
    head :no_content
  end

  private

  def set_acceptance
    @acceptance = Acceptance.find(params[:id])
    authorize @acceptance  # For Pundit
  end

  def acceptance_params
    params.require(:acceptance).permit(:title, :description, :id, :image, :paragraph_1, :paragraph_2, :paragraph_3, :paragraph_4, :paragraph_5, :paragraph_6, :author, :user_id)
  end

  def render_error
    render json: { errors: @acceptance.errors.full_messages },
      status: :unprocessable_entity
  end

end
