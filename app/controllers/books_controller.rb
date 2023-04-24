class BooksController < ApplicationController
  def  new
    @book = Book.new
  end
  def  create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
    
  end
  
  def  show
    @book = Book.find(params[:id])
  end
  
  def  index
    @book = Book.new
    @books = Book.all
    @book_images = Book.all
  end

  def  edit
     @book = Book.find(params[:id])
     
  end
  
  private

  def  book_params
    params.require(:book).permit(:user_id, :image, :body, :title)
    
  end
end
