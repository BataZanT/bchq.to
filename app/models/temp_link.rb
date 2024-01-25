class TempLink < Link
    validates :expiration_date,presence:true
    validates_with DateValidator
end
