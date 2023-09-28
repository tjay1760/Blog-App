class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  end

  def show; end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
