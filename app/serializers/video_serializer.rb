class VideoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :description, :public, :user_id, :clip

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

end
