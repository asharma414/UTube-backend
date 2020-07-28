class Comment < ApplicationRecord
    belongs_to :video
    belongs_to :user

    def comment_data
        {
            created_at: self.created_at,
            id: self.id,
            content: self.content,
            user_id: self.user.id,
            video_id: self.video_id,
            user: self.user.username
        }
    end

end
