class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :videos
    has_many :comments
    has_many :views
    has_many :genres, through: :videos
end
