class Api::V1::BriefsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_brief, only: [ :show, :update, :destroy ]

  def index
    @briefs = policy_scope(Brief)
  end


  def show
    @brief = Brief.find(params[:id])
    authorize @brief
  end

  def update
    if @brief.update(brief_params)
      render :show
    else
      render_error
    end
  end

  def create
    @brief = Brief.new(brief_params)
    @brief.user = current_user
    authorize @brief
    if @brief.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @brief.destroy
    head :no_content
  end

  private

  def set_brief
    @brief = Brief.find(params[:id])
    authorize @brief  # For Pundit
  end

  def brief_params
    params.require(:brief).permit(:wants, :needs, :id, :ethnicity, :gender, :name, :traits, :language, :flaws, :arc_summary,:province, :scene, :title)
  end

  def render_error
    render json: { errors: @brief.errors.full_messages },
      status: :unprocessable_entity
  end

end
