class DateValidator < ActiveModel::Validator
    def validate(temp_link)
        if temp_link.expiration_date < DateTime.now
            temp_link.errors.add :expiration_date, "Cant be in the past"
       end
   end
end

class TempLink < Link
    validates :expiration_date,presence:true
    validates_with DateValidator
end
