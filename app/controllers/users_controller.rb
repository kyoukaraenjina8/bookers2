class UsersController < ApplicationController

  def show
    @user =Book.find(params[:id])  
    @book_images = @user.book_images
  end

  def edit
  end
  
  def index
  end
end
