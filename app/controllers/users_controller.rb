class UsersController < ApplicationController
    def show
        @user = User.find params[:id]
        @microposts = @user.microposts
    end

    def feed
        Micropost.where("user_id = ?", id)
    end
end
