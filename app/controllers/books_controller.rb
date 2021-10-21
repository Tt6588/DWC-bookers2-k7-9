class BooksController < ApplicationController
  before_action :correct_user, only: [:update]
  before_action :authenticate_user!

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(title: book_params[:title], body: book_params[:body], user_id: current_user.id)
    @books = Book.all
    @user = current_user
    if @book.save
    redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    
    else
    render :index
    
    end

  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
  def correct_user
    book = Book.find(params[:id])
    
    if current_user.id != book.user_id
    redirect_to root_path
    end
  end

end
