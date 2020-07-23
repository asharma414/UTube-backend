class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :videos
    has_many :comments
    has_many :views
    has_many :genres, through: :videos
    has_many :user_subscriptions, foreign_key: :subscriber_id, class_name: 'Subscription'
    has_many :subscribees, through: :user_subscriptions, source: :subscribee
    has_many :subscribed_users, foreign_key: :subscribee_id, class_name: 'Subscription'
    has_many :subscribers, through: :subscribed_users


    def subscriber_count
        self.subscribers.count
    end


end
