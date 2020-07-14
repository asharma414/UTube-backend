class Video < ApplicationRecord
    has_one_attached :clip
    has_one_attached :thumbnail
    has_many :views
    has_many :comments
    belongs_to :user
end
