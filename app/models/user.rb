class User < ApplicationRecord
    has_many :videos
    has_many :comments
    has_many :views
    has_many :genres, through: :videos
end
