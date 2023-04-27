class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have created book successfully."
    redirect_to users_path(@user.id)
    else
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new
      render :show
    end
  end

  def index
    @users = User.all
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
