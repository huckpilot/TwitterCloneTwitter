class UsersController < ApplicationController

before_action :authenticate, except: [:new, :create]

  def show
    # A new @tweet must be passed through to any page that contains a new tweet form
    @tweet = Tweet.new
    @user = User.joins('INNER JOIN tweets ON users.id = tweets.user_id WHERE users.id = ?;', params[:id])
    if @user != []
      return @user
    else
      @user = User.find(params[:id])
    end
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