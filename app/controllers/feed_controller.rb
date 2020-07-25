class FeedController < ApplicationController

    def subscriptions
        render json: curr_user.subscribed_feed
    end

    def liked
        render json: curr_user.liked_feed
    end

    def viewed
    end

end