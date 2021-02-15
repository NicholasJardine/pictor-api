class Api::V1::ArticlesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_article, only: [ :show, :update, :destroy ]

  def index
    @aritcles = policy_scope(Article)
  end


  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    if @article.update(article_params)
      render :show
    else
      render_error
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @article.destroy
    head :no_content
  end

  private

  def set_article
    @article = Article.find(params[:id])
    authorize @article  # For Pundit
  end

  def article_params
    params.require(:article).permit(:title, :description, :id, :image, :paragraph_1, :paragraph_2, :paragraph_3, :paragraph_4, :paragraph_5, :paragraph_6, :author, :user_id)
  end

  def render_error
    render json: { errors: @article.errors.full_messages },
      status: :unprocessable_entity
  end

end
