class FeedController < ApplicationController

    def subscriptions
        render json: curr_user.subscribed_feed
    end

    def liked
        render json: curr_user.liked_feed
    end

    def viewed
        render json: curr_user.views.map {|view| view.video}
    end

    def channel
        if curr_user 
            if curr_user[:id] == params[:id].to_i
                render json: curr_user.private_channel
            else
                render json: User.find(params[:id]).public_channel
            end
        else
            render json: User.find(params[:id]).public_channel
        end
    end

end