class Genre < ApplicationRecord
    has_many :videos
    has_many :users, through: :videos
end
