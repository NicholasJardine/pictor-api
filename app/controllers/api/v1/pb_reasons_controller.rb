class Api::V1::BriefsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_pb_reason, only: [ :show, :update, :destroy ]

  def index
    @pb_reasons = policy_scope(PbReason)
  end


  def show
    @pb_reason = PbReason.find(params[:id])
    authorize @pb_reason
  end

  def update
    if @pb_reason.update(pb_reason_params)
      render :show
    else
      render_error
    end
  end

  def create
    @pb_reason = PbReason.new(pb_reason_params)
    @pb_reason.user = current_user
    authorize @pb_reason
    if @pb_reason.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @pb_reason.destroy
    head :no_content
  end

  private

  def set_pb_reason
    @pb_reason = PbReason.find(params[:id])
    authorize @pb_reason  # For Pundit
  end

  def pb_reason_params
    params.require(:pb_reason).permit(:wants, :needs, :id, :ethnicity, :gender, :name)
  end

  def render_error
    render json: { errors: @pb_reason.errors.full_messages },
      status: :unprocessable_entity
  end

end
