class Picture < ApplicationRecord
    mount_uploader :image, ImageUploader
    serialize :image, JSON

    validates :title, presence: true, length: { maximum: 30 }
    validates :description, presence: true, length: { maximum: 120 }
end
