class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @post = current_user.posts.build if signed_in?
      @posts = current_user.posts.paginate(page: params[:page], per_page: 5)
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
