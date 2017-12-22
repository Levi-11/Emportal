class Employee < ApplicationRecord
    attr_accessor :remember_token

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
    validates :password, presence: true, length: {minimum: 5, maximum: 15}, allow_nil: true

    def Employee.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def Employee.new_token
        SecureRandom.urlsafe_base64
    end

  
    def remember
        self.remember_token = Employee.new_token
        update_attribute(:remember_digest, Employee.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end


    def forget
        update_attribute(:remember_digest, nil)
    end

end
