class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in?
      @user = current_user
      @type = :selected
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed

      prev = Rails.application.routes.recognize_path(request.referrer)
      action = prev[:action]
      if action == "all"
        respond_to do |format|
          format.js
          format.html
        end
      else
        render :index
      end
      
    end 
  end

  def all 

    if user_signed_in?
      @user = current_user
      @type = :all
      @micropost = current_user.microposts.build
      @feed_items = Micropost.all

      prev = Rails.application.routes.recognize_path(request.referrer)
      action = prev[:action]
      if action == "index"
        respond_to do |format|
          format.js
          format.html
        end 
      else
        render :all
      end
    end
  end

end
