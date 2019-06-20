class Contact < ApplicationRecord

    validates :name, presence: true
    validates :email, presence: true
    validates :fleet, presence: true
    validates :phone_number, presence: true, format: { with: PHONE_REGEX }

    PHONE_REGEX = /((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}/
end