class UsersController < ApplicationController
  def index
    @user = users.all
  end


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def update

  end

  private

  def current_user?(user)
  user = current_user
  end

  def user_params
    params.require(:user).permit(:profile_image, :name, :body)
  end
end
