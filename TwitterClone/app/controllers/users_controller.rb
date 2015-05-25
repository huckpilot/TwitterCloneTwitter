class UsersController < ApplicationController

before_action :authenticate, except: [:new, :create]

  def show
    # A new @tweet must be passed through to any page that contains a new tweet form
    @tweet = Tweet.new
    @tweets = {
      :tweets => Tweet.where(user_id: session[:user_id]),
      :form => {
        :action => tweets_path,
        :csrf_param => request_forgery_protection_token,
        :csrf_token => form_authenticity_token
      }
    }
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
