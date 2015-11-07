class PostsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: :destroy
  respond_to :html, :js
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @user = current_user
    @posts = current_user.posts.paginate(page: params[:page], per_page: 5)
    
    respond_to do |format|
    if @post.save
      format.html { redirect_to user_path(current_user) }
      format.js
      format.json {}
    else
      format.html { redirect_to :back }
      format.json {}
    end
  end
  end

  def destroy
    @post.destroy
    @posts = current_user.posts.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.js
      format.json {}
    end
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

