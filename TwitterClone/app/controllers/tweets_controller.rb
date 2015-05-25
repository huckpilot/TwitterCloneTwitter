class TweetsController < ApplicationController
  def create
    @tweet = Tweet.create(user_id: session[:user_id], content: tweet_params[:content])
    if request.xhr?
      render :json => Tweet.where(user_id: session[:user_id])
    end
  end

  def index
    @tweets = Tweet.where(user_id: session[:user_id])
  end


  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end
