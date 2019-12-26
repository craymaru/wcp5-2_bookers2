class UsersController < ApplicationController
  # Adds: reject not-signin users
  before_action :authenticate_user!

  def index
    @users = User.all
    @book_new = Book.new # left content
    @user = current_user # left content
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new # left content
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # Update Validations
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updatad user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
