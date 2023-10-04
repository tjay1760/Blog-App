class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 2)
  end

  def show
    @current = current_user
    @user = @post.author
    @comment = Comment.new
    @comments = @post.comments
    @post = Post.includes(comments: :user).find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post was created'

    else
      puts @post.errors.full_messages
      flash.now[:alert] = 'Post could not be created. Please try again.'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
