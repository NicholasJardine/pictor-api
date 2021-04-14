class Api::V1::ApplisController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_appli, only: [ :show, :update, :destroy ]

  def index
    @applis = policy_scope(Appli)
  end


  def show
    @appli = Appli.find(params[:id])
    authorize @appli
  end

  def update
    if @appli.update(appli_params)
      render :show
    else
      render_error
    end
  end

  def create
    @appli = Appli.new(appli_params)
    @appli.user = current_user
    authorize @appli
    if @appli.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @appli.destroy
    head :no_content
  end

  private

  def set_appli
    @appli = Appli.find(params[:id])
    authorize @appli  # For Pundit
  end

  def appli_params
    params.require(:appli).permit(:title, :description, :id, :image, :paragraph_1, :paragraph_2, :paragraph_3, :paragraph_4, :paragraph_5, :paragraph_6, :author, :user_id)
  end

  def render_error
    render json: { errors: @appli.errors.full_messages },
      status: :unprocessable_entity
  end

end
