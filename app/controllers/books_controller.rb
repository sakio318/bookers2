class BooksController < ApplicationController
before_action :authenticate_user!

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice: 'Book was successfully create.'
    else
      @user = current_user
      render action: :index
    end
  end

  def index

    @new_book = Book.new
    @book = @new_book
    @books = Book.all
    @user = current_user

  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Book was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully delete.'
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

  def book_params
    params.require(:book).permit(:title, :body)
  end
end