class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to :back
    else
      flash[:danger] = "error, comment can't be saved, probably it's too long"
      redirect_to :back

    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end