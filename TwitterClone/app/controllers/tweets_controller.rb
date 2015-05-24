class TweetsController < ApplicationController
  def create
    @tweet = Tweet.create(user_id: session[:user_id], content: tweet_params[:content])
    redirect_to user_path(session[:user_id])
  end

  private
  def tweet_params
    puts "THIS IS A TEST"
    puts @tweet
    params.require(:tweet).permit(:user_id, :content)
  end
end