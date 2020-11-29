class UsersController < ApplicationController
  def index
    @user = users.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  private
  def user
    params.require(:user).permit(:user, :image, :name)
  end
end
