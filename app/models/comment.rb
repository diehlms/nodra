class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :article

    validates :comment, presence: true, allow_blank: false, length: { maximum: 1000}
end
