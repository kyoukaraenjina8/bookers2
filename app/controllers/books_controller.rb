class BooksController < ApplicationController
  before_action :a, only: [:edit, :update]

  def  create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def  index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def  show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new

  end

  def  edit
     @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  private
  def a
    book = Book.find(params[:id])
    user =book.user
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

  def  book_params
    params.require(:book).permit(:body, :title)

  end
end
