class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
    @book = @new_book

  end


  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
    @book = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(id: current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id), notice: 'Userinfo was successfully update.'
    else
      render "edit"
    end
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.followed
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
  def search
    @user_or_book = params[:option]
    @how_seach = params[:choice]
    if @user_or_book == "1"
      @users = User.search(params[:search],@user_or_book,@how_seach)
    elsif @user_or_book == "2"
      @books = Book.search(params[:search],@user_or_book,@how_seach)
    else
    end
  end


  private

  def current_user?(user)
  user = current_user
  end

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
