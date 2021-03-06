class UsersController < ApplicationController

  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end
 
  def show
    @user = User.where(id: params[:id]).first
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)
    @post = current_user.posts.new if signed_in?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Congratulations! You are now registered user!"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end

  def my_comments
    user_comments=Comment.find_by(user_id: @user.id)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :avatar)
    end

    #def signed_in_user
      #redirect_to signin_url, notice: "Please, sign in" unless signed_in? 
    #end



    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
