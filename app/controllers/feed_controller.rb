class FeedController < ApplicationController

    def subscriptions
        render json: curr_user.subscribed_feed
    end

    def liked
    end

    def viewed
    end

end