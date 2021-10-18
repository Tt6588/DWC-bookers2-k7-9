class BooksController < ApplicationController
  
  def create
  end
  
  def index
    @user = current_user
    @book = Book.new
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
  
end
