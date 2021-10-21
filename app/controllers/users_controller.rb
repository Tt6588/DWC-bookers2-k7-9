class UsersController < ApplicationController
  before_action :correct_user, only: [:update]
  before_action :authenticate_user!
  
  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
    
    if @user == current_user
      render :edit
    else 
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
  
    else
      render :edit
    end
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def correct_user
     user = User.find(params[:id])
     
     if current_user != user
       redirect_to root_path
     end
  end
    
end