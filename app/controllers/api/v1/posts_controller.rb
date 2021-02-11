class Api::V1::PostsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_post, only: [ :show, :update ]

  def index
    @posts = policy_scope(Post)
  end


  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    if @post.update(post_params)
      render :show
    else
      render_error
    end
  end


  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post  # For Pundit
  end

  def post_params
    params.require(:post).permit(:caption, :image, :id)

  end

  def render_error
    render json: { errors: @post.errors.full_messages },
      status: :unprocessable_entity
  end

end
