class TweetsController < ApplicationController
  def index
    @tweets = Tweet.where(user_id: session[:user_id])
  end

  def create
    @tweet = Tweet.create(user_id: session[:user_id], content: tweet_params[:content])
    if request.xhr?
      render :json => Tweet.where(user_id: session[:user_id])
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    if request.xhr?
      render :json => Tweet.where(user_id: session[:user_id])
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end
