class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    if current_user.present?
      @user = params[:id] ? User.find(params[:id]) : current_user

      @user_bookmarks = @user.bookmarks
      @liked_bookmarks = @user.likes
    else
      redirect_to new_user_registration_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
