class UsersController < ApplicationController
    
  
  def index
    @user = current_user
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path(@user.id)
  end
  
  def show
    @user = current_user
    @book = Book.new
    @books = @user.books
  end
  
  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
    
end