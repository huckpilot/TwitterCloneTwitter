class UsersController < ApplicationController

before_action :authenticate, except: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
  end

private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end