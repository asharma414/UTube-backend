class Like < ApplicationRecord
    validates :user_id, uniqueness: true
    belongs_to :video
    belongs_to :user
end
