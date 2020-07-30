class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :videos
    has_many :comments
    has_many :views
    has_many :likes
    has_many :genres, through: :videos
    has_many :user_subscriptions, foreign_key: :subscriber_id, class_name: 'Subscription'
    has_many :subscribees, through: :user_subscriptions, source: :subscribee
    has_many :subscribed_users, foreign_key: :subscribee_id, class_name: 'Subscription'
    has_many :subscribers, through: :subscribed_users

    def subscriber_count
        self.subscribers.count
    end

    def subscribed_feed
        # self.subscribees.map {|subscribee| subscribee.videos.where(public: true).where('created_at > ?', DateTime.now-7)}.flatten
        self.subscribees.map {|subscribee| subscribee.videos.where(public: true)}.flatten
    end

    def liked_feed
        self.likes.where(dislike: false).map {|like| like.video}
    end

    def viewed_feed
        self.views.uniq.map {|view| view.video}
    end

    def public_channel
        self.videos.where(public: true)
    end

    def private_channel
        self.videos
    end

end
