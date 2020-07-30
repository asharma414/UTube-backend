class VideoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :description, :user_id, :thumbnail, :user, :duration, :genre, :view_count, :created_at

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
