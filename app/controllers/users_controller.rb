class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_confirmation_email
      flash[:success] = "Please check email to activate account"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def send_confirmation_email
    UserMailer.new_user(current_user).deliver_now
  end

end
