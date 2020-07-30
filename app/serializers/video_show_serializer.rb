class VideoShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :description, :public, :user_id, :clip, :thumbnail, :user, :duration, :genre, :like_count, :dislike_count, :view_count, :comments, :created_at

  def clip
    return unless object.clip.attached?
    object.clip.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: clip_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def comments
    object.comments.map {|comment| comment.comment_data}
  end

  def clip_url
    url_for(object.clip)
  end

  def user
    user = { username: object.user.username, subscriber_count: object.user.subscriber_count }
  end

end
