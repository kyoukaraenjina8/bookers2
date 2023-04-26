class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
  def update
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user.id)
  end

  def index
    @user = User.all
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
