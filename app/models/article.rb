class Article < ActiveRecord::Base
    belongs_to :user

    { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 1000}
    validates :user_id, presence: true
end