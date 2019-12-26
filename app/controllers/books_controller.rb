class BooksController < ApplicationController
  # Adds: reject not-signin users
  before_action :authenticate_user!

  def index
    @books = Book.all
    @book_new = Book.new # left content
    @user = current_user # left content
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user # left content
    @book_new = Book.new # left content
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    # Another Syntax
    # book = current_user.book.new(book_params_params)
    book.save
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
