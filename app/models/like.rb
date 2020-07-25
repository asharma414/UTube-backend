class Like < ApplicationRecord
    validates :user_id, uniqueness: { scope: :video_id }
    belongs_to :video
    belongs_to :user
end
