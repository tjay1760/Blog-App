class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :set_user, only: [:new]
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  end

  def show
    @current = current_user
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params) 
    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post was successfully created.'
    else
      flash.now[:alert] = 'Post could not be created. Please try again.'
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
  def set_user
    @user = current_user
  end
  def post_params
    params.require(:post).permit(:title, :text) 
  end
end
