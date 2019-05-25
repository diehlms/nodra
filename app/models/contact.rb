class Contact < ApplicationRecord

    validates :name, presence: true
    validates :email, presence: true
    validates :fleet, presence: true
    validates :phone_number, presence: true

end