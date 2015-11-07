class CommentsController < ApplicationController

  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id    
    @posts = @post.user.posts.paginate(page: params[:page], per_page: 5)
    
    respond_to do |format|
    if @comment.save
      format.html { redirect_to :back }
      format.js
      format.json { }
    else
      format.html { flash[:danger] = "error, comment can't be saved, probably it's too long"
                    redirect_to :back }
      format.json {}
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