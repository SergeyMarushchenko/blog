class PostsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build(post_params)
    @user = current_user
    @feed_items = current_user.feed
    
    respond_to do |format|
    if @post.save
      format.html { redirect_to user_path(current_user) }
      format.js
      format.json {}
    else
      format.html { render 'static_pages/home' 
                              @feed_items = [] }
      format.json { }
    end
  end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user)
  end

  private

    def post_params
      params.require(:post).permit(:content, :title)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end

