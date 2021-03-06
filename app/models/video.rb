class Video < ApplicationRecord
    has_one_attached :clip
    has_one_attached :thumbnail
    has_many :views
    has_many :likes
    has_many :comments
    belongs_to :user
    belongs_to :genre
    validate :video_type
    validate :image_type
    validates :title, presence: true
    validates :description, presence: true

    def generate_thumbnail
        return self.thumbnail.variant(resize: '250x250!').processed
    end

    def view_count
        self.views.count
    end

    def like_count
        self.likes.where(dislike: false).count
    end

    def dislike_count
        self.likes.where(dislike: true).count
    end

    def duration
        ActiveStorage::Analyzer::VideoAnalyzer.new(self.clip.blob).metadata[:duration]
    end

    private

    def image_type
        if thumbnail.attached? && !thumbnail.content_type.in?(%w(image/jpeg image/png))
            errors.add(:thumbnail, 'must be a JPEG or PNG')
        elsif thumbnail.attached? == false
            errors.add(:thumbnail, 'required')
        end
    end

    def video_type
        if clip.attached? == false
            errors.add(:clip, "are missing!")
        end
        if !clip.content_type.in?(%('video/mp4 video/webm'))
            errors.add(:clip, 'needs to be an MP4 or WEBM')
        end
    end
end
