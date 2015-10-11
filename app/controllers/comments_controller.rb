class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|

    if @comment.save
      format.html {redirect_to :back, notice: 'post commented'}
      format.js {}
      format.json {render json: @user, status: :created, location: @user }
      #redirect_to :back
    else
      flash[:danger] = "error, comment can't be saved, probably it's too long"
      redirect_to :back
    end
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