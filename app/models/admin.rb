class Admin < ApplicationRecord
    attr_accessor :remember_token
    has_secure_password
    validates :username,  presence: true, length: {maximum: 50}, uniqueness: true
    validates :password, presence: true, length: {minimum: 5, maximum: 15}

    def Admin.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def Admin.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = Admin.new_token
        update_attribute(:remember_digest, Admin.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end
end
