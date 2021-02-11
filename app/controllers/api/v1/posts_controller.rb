class Api::V1::PostsController < Api::V1::BaseController
    # before_action :set_restaurant, only: [ :show ]

  def index
    @posts = policy_scope(Post)
  end


  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  # private

  # def set_restaurant
  #   @post = Post.find(params[:id])
  #   authorize @post  # For Pundit
  # end

end
