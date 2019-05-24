class Event < ApplicationRecord
    belongs_to :user

    validates :event_title, presence: true, length: { maximum: 50 }
    validates :event_content, presence: true, length: { maximum: 1000 }
    validates :user_id, presence: true
end
