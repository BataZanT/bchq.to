class PrivLink < Link
    has_secure_password
    validates :password_digest,presence: true
end