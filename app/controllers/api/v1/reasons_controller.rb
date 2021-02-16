class Api::V1::BriefsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_reason, only: [ :show, :update, :destroy ]

  def index
    @reasons = policy_scope(Reason)
  end


  def show
    @reason = Reason.find(params[:id])
    authorize @reason
  end

  def update
    if @reason.update(reason_params)
      render :show
    else
      render_error
    end
  end

  def create
    @reason = Reason.new(reason_params)
    @reason.user = current_user
    authorize @reason
    if @reason.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @reason.destroy
    head :no_content
  end

  private

  def set_brief
    @reason = Reason.find(params[:id])
    authorize @reason  # For Pundit
  end

  def reason_params
    params.require(:reason).permit(:wants, :needs, :id, :ethnicity, :gender, :name)
  end

  def render_error
    render json: { errors: @reason.errors.full_messages },
      status: :unprocessable_entity
  end

end
