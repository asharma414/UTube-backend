class VideoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :description, :public, :user_id, :clip, :thumbnail, :user, :duration, :genre

  def clip
    return unless object.clip.attached?
    object.clip.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: clip_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def clip_url
    url_for(object.clip)
  end

  def thumbnail
    return unless object.thumbnail.attached?
    object.generate_thumbnail.blob.attributes
      .slice('filename', 'byte_size')
      .merge(url: thumbnail_url)
      .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def thumbnail_url
    url_for(object.generate_thumbnail)
  end

  def user
   user = { username: object.user.username, subscriber_count: object.user.subscriber_count }
  end

end
