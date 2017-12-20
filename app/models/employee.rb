class Employee < ApplicationRecord
    validates :name, presence: true
    validates :designation, presence: true
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.([a-z]){2,3}+){1,2}\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :username, presence: true
    PHONE_REGEX = /\A([0-9]+){10}\z/
    validates :phone, format: {with: PHONE_REGEX}
    validates :date_of_join, presence: true
    validates :address, presence: true
    has_secure_password
    validates :password, presence: true, length: {minimum: 5, maximum: 15}
    validates :active, presence: true

end
