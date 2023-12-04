class Link < ApplicationRecord
    belongs_to :user 
    validates :title, presence: true
    validates :url, presence: true ,format:{with: /\A#{URI::regexp}\z/, message: "that is not a valid URL"}
    validates :uses, presence: true 
    validates :user_id, presence:true
end
