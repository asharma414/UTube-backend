class Video < ApplicationRecord
    has_one_attached :clip
    has_one_attached :thumbnail
    has_many :views
    has_many :comments
    belongs_to :user
    validates :title, presence: true
    validates :description, presence: true

    def generate_thumbnail
        return self.thumbnail.variant(resize: '250x250!').processed
    end

    def duration
        ActiveStorage::Analyzer::VideoAnalyzer.new(self.clip.blob).metadata[:duration]
    end

    private
    def video_type
        if clip.attached? == false
            errors.add(:clip, "are missing!")
        end
        if !clip.content_type.in?(%('video/mp4 video/webm'))
            errors.add(:clip, 'needs to be an MP4 or WEBM')
        end
    end
end
