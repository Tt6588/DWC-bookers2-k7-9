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

    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday

    @toweek_book = @books.created_toweek
    @lastweek_book = @books.created_lastweek

    @day2_book = @books.created_day2
    @day3_book = @books.created_day3
    @day4_book = @books.created_day4
    @day5_book = @books.created_day5
    @day6_book = @books.created_day6


    @articles = Book.all
    @article_by_day = @articles.group_by_day(:created_at).size
    @chartlabels = @article_by_day.map(&:first).to_json.html_safe
    @chartdatas = @article_by_day.map(&:second)
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