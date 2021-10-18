class BooksController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
