class UsersController < ApplicationController

    before_action :authenticate_user!, except: [:top]
  def index
    @user = current_user
    @users = User.all
    @books = @user.books
    @book = Book.new
  end



  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @usre = current_user
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

def update
  @user = User.find(params[:id])
  @user = current_user

  if   @user.update(user_params)
    @user = User.all
    @user = current_user
    redirect_to  user_path(@user.id),notice: "You have updated user successfully."
  else
    render :edit
  end
end

private

def user_params
 params.require(:user).permit(:introduction, :name, :profile_image, :title, :body)
end


end
