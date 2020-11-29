class UsersController < ApplicationController
  def index
    @user = users.all
  end


  def show
    @user = User.find(params[:id])
    #@book = @user.books
  end

  def edit
  end

  def update
  end

  private
  def user
    params.require(:user).permit(:image, :name)
  end
end
