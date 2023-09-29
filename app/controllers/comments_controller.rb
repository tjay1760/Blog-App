class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @current = current_user
    @post = Post.find(params[:post_id])
    @new_comment = @post.comments.build(comment_params)
    @new_comment.user = @current

    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to user_post_path(current_user, @post), notice: 'Comment created successfully' }
      else
        format.html { render 'posts/show', alert: 'Comment not created successfully' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
