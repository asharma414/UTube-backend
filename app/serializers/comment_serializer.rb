class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user

  def user
    object.user.username
  end

end