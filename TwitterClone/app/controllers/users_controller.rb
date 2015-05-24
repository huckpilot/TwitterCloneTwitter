class UsersController < ApplicationController

before_action :authenticate, except: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end