class Access < ApplicationRecord
    belongs_to :link
    validates :ip, presence: true, format:{with:/(?:[0-9]{1,3}\.){3}[0-9]{1,3}/}
    validates :date_and_time, presence: true
end