class Api::V1::AccountComplaintsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_account_complaint, only: [ :show, :update, :destroy ]

  def index
    @account_complaints = policy_scope(AccountComplaint)
  end


  def show
    @account_complaint = AccountComplaint.find(params[:id])
    authorize @account_complaint
  end

  def update
    if @account_complaint.update(account_complaint_params)
      render :show
    else
      render_error
    end
  end

  def create
    @account_complaint = AccountComplaint.new(account_complaint_params)
    @account_complaint.user = current_user
    authorize @account_complaint
    if @account_complaint.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @account_complaint.destroy
    head :no_content
  end

  private

  def set_account_complaint
    @account_complaint = AccountComplaint.find(params[:id])
    authorize @account_complaint  # For Pundit
  end

  def account_complaint_params
    params.require(:account_complaint).permit(:title, :description, :id, :image, :paragraph_1, :paragraph_2, :paragraph_3, :paragraph_4, :paragraph_5, :paragraph_6, :author, :user_id)
  end

  def render_error
    render json: { errors: @account_complaint.errors.full_messages },
      status: :unprocessable_entity
  end

end
