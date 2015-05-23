class SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  def new

  end
end