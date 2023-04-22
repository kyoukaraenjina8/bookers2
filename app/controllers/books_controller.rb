class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_image_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_images_path
  end
  def show
  end

  def edit
  end
  
  private

  def post_image_params
    params.require(:book_image).permit(:name, :image, :opinion)
  end
end
