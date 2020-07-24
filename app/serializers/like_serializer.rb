class LikeSerializer < ActiveModel::Serializer
  attributes :id, :video_id, :user_id, :dislike
end
