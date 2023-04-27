class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def  new
    @book = Book.new
  end

  def  create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to books_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def  index
    #@book = Book.new
    @books = Book.all
  end

  def  show
    @book = Book.find(params[:id])
  end

  def  edit
     @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  private

  def  book_params
    params.require(:book).permit(:user_id, :image, :body, :title)

  end
end
