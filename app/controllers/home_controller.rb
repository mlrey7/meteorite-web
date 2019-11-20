class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in?
      @user = current_user
      @type = :selected
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed
    end 
  end

  def all 
    if user_signed_in?
      @user = current_user
      @type = :all
      @micropost = current_user.microposts.build
      @feed_items = Micropost.all
      render :index
    end
  end

end
