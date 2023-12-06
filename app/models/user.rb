class User < ApplicationRecord
    has_secure_password
    validates  :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :mail, presence: true, format:{with: /\A[^@\s]+@[^@\s]+\z/, message: "email address not valid"},uniqueness: true
    has_many :links, dependent: :destroy
end
