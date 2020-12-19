class SearchsController < ApplicationController

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

end
